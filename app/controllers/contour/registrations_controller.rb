class Contour::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, only: [ :new ]

  def create
    if signed_in?
      # TODO: Should use "Resource" and not "User"
      params[:user][:password] = params[:user][:password_confirmation] = Digest::SHA1.hexdigest(Time.now.usec.to_s)[0..19] if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

      # self.resource = build_resource(sign_up_params)
      @user = build_resource(sign_up_params)

      if @user.save
        respond_to do |format|
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user.as_json( only: ([ :id, :email, :authentication_token ] | Contour::sign_up_fields.collect{|a| a[:attribute].to_sym}) ), status: :created, location: @user }
        end
      else
        respond_to do |format|
          format.html { render action: "/users/new" }
          format.json { render json: @user.errors, status: :unprocessable_entity}
        end
      end
    else
      super
      session[:omniauth] = nil if @user and not @user.new_record?
    end
  end

  protected

    def sign_up_params
      permitted_fields = Contour::sign_up_fields.collect{|a| a[:attribute].to_sym}  | [ :email, :password, :password_confirmation ]
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(*permitted_fields) }
      devise_parameter_sanitizer.for(:sign_up)
    end

    def build_resource(hash=nil)
      object = super(hash)
      if session[:omniauth]
        @user.apply_omniauth(session[:omniauth])
        @user.valid?
      end
      object
    end

    def after_inactive_sign_up_path_for(resource)
      new_session_path(resource) # root_path
    end

end
