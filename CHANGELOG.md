## 1.3.0 (February 26, 2013)

### Breaking Changes
- Removed qTip^2 JavaScript to reduce overall JavaScript footprint

### Enhancements
- **Gem Changes**
  - Updated to omniauth 1.1.3
  - Updated to omniauth-ldap 1.0.3
  - Updated to omniauth-linkedin 0.1.0

## 1.2.1 (February 20, 2013)

### Enhancements
- Flash notices are now displayed underneath the menu bar as a float
  - Flash notices can be customized by overwriting the CSS for `.flash-block` and `.navbar-alert`

## 1.2.0 (February 15, 2013)

### Breaking Changes
- Removed support for the subnav partial

### Enhancements
- Updated Twitter Bootstrap to 2.3.0
- Updated Gem Dependencies
  - devise 2.2.3, jquery-rails 2.2.1, rails 3.2.12
- Updated jQuery UI to 1.10.0, the following modules are included:
  - UI Core: Core, Widget, Mouse
  - Interactions: Draggable, Droppable, Sortable
  - Effects: Effects Core, Fade, Highlight
- Updated qTip2 to account for deprecations in jQuery 1.9.1
- Added bootstrap-datepicker and bootstrap-timepicker
- Contour can now be configured to have a search bar in the navigation menu
  - For example:
```ruby
      config.search_bar = {
        display: 'always',
        id: 'global-search',
        path: 'search_path',
        placeholder: 'Search',
        position: 'left'
      }
```
- Flash messages have been moved up into the navbar

## 1.1.3 (February 11, 2013)

### Enhancements
- Tooltip base line-height is now fixed at 20px
- Update Gem Dependencies
  - rails 3.2.11
- Removed tooltips from alternate login providers to save iPhones and iPads from clicking the authentication button twice
- Added a `.center` CSS class to use instead of the deprecated `<center>` tag

### Bug Fix
- apply_omniauth(omniauth) updated to account for PostgreSQL error, see [README](https://github.com/remomueller/contour/blob/master/README.md)

## 1.1.2 (January 3, 2013)

### Enhancements
- Recommended Ruby bumped to 1.9.3-p327
- Updated Twitter Bootstrap to 2.2.2
- Updated HighCharts to 2.3.3
- Kaminari Pagination styling now provided, available themes:
  - `<%= paginate @items, theme: "contour[-large|-small|-mini]" %>`
- Update Gem Dependencies
  - rails 3.2.10, jquery-rails 2.1.4, omniauth-cas 1.0.1, omniauth-twitter 0.0.14
- Updated Bootstrap-Scroll-Modal to version 1.2
- nonStandardClick(event) helper JavaScript added to capture clicks

## 1.1.1 (October 30, 2012)

### Bug Fix
- Renamed `LICENSE` to `LICENSE.txt` to keep assets from failing to compile in Rails 3.2.9.rc1

## 1.1.0 (September 18, 2012)

### Enhancements
- Updated jQuery UI to 1.8.22, the following modules are included:
  - UI Core: Core, Widget, Mouse
  - Interactions: Draggable, Droppable, Resizable, Selectable, Sortable
  - Widgets: Datepicker
  - Effects: Effects Core, Blind, Bounce, Clip, Drop, Explode, Fade, Fold, Highlight, Pulsate, Scale, Shake, Slide, Transfer
- Updated Twitter Bootstrap from 2.0.4 to 2.1.1

### Breaking Changes
- Unobtrusive JS now required, JavaScript is now included at bottom of HTML to improve perceived page load

## 1.0.6 (September 10, 2012)

### Enhancements
- Login and Registration API now return authentication token, first_name, last_name, id, and email for JSON requests on successful login

## 1.0.5 (August 21, 2012)

### Bug Fix
- IE8 no longer shows security warning due to http reference to shim.js when using https by default

## 1.0.4 (August 14, 2012)

### Enhancements
- Rails updated to minimum 3.2.8
  - Removed deprecated use of update_attribute for Rails 4.0 compatibility
- Cancel button no longer uses btn-danger class for consistency with Bootstrap cancel button defaults
- `devise.failure.unauthenticated` message is no longer displayed when navigating to the root_url
- `rails g contour:scaffold` updated to include better ordering and object counts on index pages
- Sign in with PROVIDER buttons added to sign in page

### Testing
- Use ActionDispatch for Integration tests instead of ActionController

## 1.0.3 (July 11, 2012)

### Enhancements
- JavaScript includes reordered to allow Twitter Bootstrap buttons to be the default $().button() instead of jQuery UI
- Added styling CSS for an About page
- All headers (h1, h2, ...) have had their font-weight changed from bold to 300
- Flash messages can be added using JavaScript:
  - flashMessage('My Message', alert_type, overwrite)
    - alert_type can be 'success' (default), 'error', 'info', or '', which are green, red, blue, and yellow respectively
    - overwrite can be `true` (default), or `false` in which case it will append to the already existing alerts

## 1.0.2 (June 19, 2012)

### Enhancements
- Rails updated to minimum 3.2.6
  - :confirm links updated to use data: { :confirm } to account for deprecations in Rails 4.0
- Devise updated to minimum 2.1.2
- Twitter Bootstrap updated to 2.0.4
  - Now includes all Bootstrap JavaScript Plugins, http://twitter.github.com/bootstrap/javascript.html
  - Added styling for .subnav and .subnav-fixed
- Subnav Partial added, can be called as follows: **Subnav was REMOVED in 1.2.0**
  - `render partial: 'contour/layouts/subnav', locals: { links: [{name: 'Link A', sublinks: [{name: 'Sublink 1'}, {name: 'Sublink 2'}]}, {name: 'Link B'}]}`

## 1.0.1 (June 1, 2012)

### Enhancements
- Rails updated to minimum 3.2.5
- Recommended use of Ruby 1.9.3-p194

## 1.0.0 (May 31, 2012)

### Enhancements
- Twitter-Bootstrap CSS layout is now default!
- Authentications can now be placed as a submenu using { authentications: true } anywhere in the contour links configuration
- Rails updated to minimum 3.2.4
- Redirects to the user's alternate login page if a user fails to login on the default devise sign in page
- Registration page can now have fields added by modifying `config.sign_up_fields`
  - Ex: `config.sign_up_fields = [ { attribute: 'first_name', type: 'text_field' }, { attribute: 'last_name', type: 'text_field' } ]`
- An empty `links` array is no longer required when specifying a menu item without a submenu
- Submenus are properly hidden if none of the submenu link conditions evaluate to true
- Added Rails scaffold generator
  - `rails generate contour:scaffold ModelName`
  - NOTE: This generator currently assumes you have a scope named current in your model. The conditions can be modified to limit only those records who are not deleted for example.
    - `scope :current, conditions: { }`

### Breaking Changes
- CSS updated to use Twitter-Bootstrap
  - New CSS classes here: http://twitter.github.com/bootstrap/base-css.html
  - New JS operations here: http://twitter.github.com/bootstrap/javascript.html
  - New Components here: http://twitter.github.com/bootstrap/components.html
- All icons other than Gentleface 16x16 have been removed
- User model no longer requires a name attribute or method
- Authentication model is no longer required to be the user model
- Authentication model creation no longer assigns application specific variables, i.e. first_name, last_name

## 0.10.2 (March 2, 2012)

### Bug Fix
- CSS fixed for positive and negative classes for buttons

## 0.10.1 (February 14, 2012)

### Enhancements
- Added options for setting body_background_{image|color} and link_color
  - Setting these as arrays will rotate through on a daily basis
  - Use the month_day configuration to set specific colors/images for select days

## 0.10.0 (February 13, 2012)

### Enhancements
- Changes made to accomodate contour template gems like contour-minimalist

## 0.9.4 (February 13, 2012)

### Enhancements
- Dependency for Rails updated to 3.2.1 and Devise 2.0.1
- Devise no longer complains about missing Engine Route, set to :main_app
- Removed Devise fix that is no longer needed as of Devise 2.0.1

### Testing
- Passwords controller test added for "Forget Password"

## 0.9.3 (January 20, 2012)

### Enhancements
- Dependency for Rails updated to 3.2.0 and OmniAuth 1.0.2
- Updated to use Devise 2.0.0.rc
  - Important! Update Devise Migrations to new format! https://github.com/plataformatec/devise/wiki/How-To:-Upgrade-to-Devise-2.0-migration-schema-style

### Refactoring
- Removed debug logging information

## 0.9.2 (January 18, 2012)

### Bug Fix
- HTTP Basic Auth failure fix for Devise added, (Do not use ActiveSupport::Base64, https://github.com/plataformatec/devise/commit/9549a32500301c0a60a41bc31311b6198a8f0670)

## 0.9.1 (January 16, 2012)

### Bug Fix
- rails generate contour:install now installs the correct omniauth.rb configuration file

## 0.9.0 (January 13, 2012)

### Enhancements
- Updated Contour to work with OmniAuth 1.0
  - Contour will now provide support for the following providers:
    - OmniAuth OpenID
    - OmniAuth LDAP
    - OmniAuth Twitter
    - OmniAuth Facebook
    - OmniAuth LinkedIn
    - OmniAuth CAS
  - Authentication provider names now rely on the OmniAuth camelizations

### Testing
- SimpleCov testing updated to show gem test coverage

## 0.8.4 (January 12, 2012)

### Bug Fix
- OmniAuth Builder updated to work with Rack 1.4.0
- Menu Items no longer require a path (url link) to be specified and the option can now be omitted as it is optional
- Silent 404 no longer occurs when the `Contour.header_title_image` is left blank

### Testing
- Dummy Application tests added:
  - Functional Tests for Authentication Controller
  - Functional Tests for Registration Controller
  - Integration Tests for Navigation
  - Unit Tests for Authentication Model
  - Unit Tests for User Model
- Continuous Integration using TravisCI (travis-ci.org)

## 0.8.3 (January 9, 2012)

### Enhancements
- Added icons from gentleface.com (see LICENSE in /app/assets/images/gentleface/LICENSE)
  - You can reference icons using
    - `<%= image_tag('gentleface/[16|32|48]/checkmark.png') %>`
  - Note: in 1.0.0+ the `images/contour/gentleface` icons will be removed and be moved to `images/gentleface`

## 0.8.2 (January 9, 2012)

### Bug Fix
- Submit buttons on new registration, new session, and new password have been fixed

## 0.8.1 (January 6, 2012)

### Bug Fix
- rake assets:precompile now works due to Sprockets 2.1.2 incorrectly assuming that .src was a x-wais-source file instead of a javascript file

## 0.8.0 (January 3, 2012)

### Enhancements
- Updated to require Rails 3.2.x for ~> 0.8.0
- Google Omniauth authentication now uses OpenID protocol
      # Replace
        provider :google_apps, OpenID::Store::Filesystem.new('/tmp')
      # With
        provider :open_id, OpenID::Store::Filesystem.new('/tmp'), name: 'google_apps', identifier: 'https://www.google.com/accounts/o8/id'
- Added icons from gentleface.com (see LICENSE in /app/assets/images/contour/gentleface/LICENSE)
- Added qTip2, http://craigsworks.com/projects/qtip2/, distributed under http://creativecommons.org/licenses/by/3.0/

### Bug Fix
- Fixed Rails 3.2.x deprecation warning due to passing the format in the template name for render :template

## 0.7.2 (January 3, 2012)

### Bug Fix
- Print layouts can now be specified using @media print{} block in CSS

## 0.7.1 (December 14, 2011)

### Bug Fix
- Settings default menu item removed

### Documentation
- Contour Menu Items no longer require a unique id
- README updated to reflects that Contour requires Rails 3.1.3 for ~> 0.7.0

## 0.7.0 (December 13, 2011)

### Enhancements
- Restructuring gem to be more in line with a gem created by 'rails plugin new'
- Menu system updated to use embedded ul and li tags, and jQuery to capture mouseenter and mouseleave
- GUI updates for alert and notice popups

### Testing
- Adding dummy app and tests

### Bug Fix
- New Menu system is now IE7+ compatible

## 0.6.1 (November 14, 2011)

### Bug Fix
- Samples Index page now correctly displays the Contour version number

## 0.6.0 (November 14, 2011)

### Enhancements
- Underlying HighCharts Library updated to 2.1.9 to work with jQuery 1.7.0
- Added jquery-rails ~> 1.0.17 as a dependency

### Bug Fix
- CSS classes negative and positive now properly apply color to their corresponding links

## 0.5.7 (November 14, 2011)

### Enhancements
- Authentications link is now hidden by default if no additional providers have been specified for Omniauth

### Bug Fix
- Dependency added for jquery-rails 1.0.0 to 1.0.16 since jquery-rails 1.0.17 switches to jQuery 1.7.0 which is incompatible with HighCharts 2.1.4 which requires jQuery 1.6.4

## 0.5.6 (October 11, 2011)

### Bug Fix
- SSL Verify Mode set to VERIFY_NONE so that RSS feeds using https can be read and parsed

## 0.5.5 (October 10, 2011)

### Bug Fix
- after_inactive_sign_up_path_for is now set to redirect to new_session_path(resource) to properly show message and to avoid redirect when the root_path is not publicly available

## 0.5.4 (October 10, 2011)

### Enhancements
- Added arrow.png image asset
- Added config.news_feed options that allows users to specify an RSS feed url that is displayed on the login page
- Added config.news_feed_items to be able to specify the maximum number of items displayed in the News Feed

### Refactoring
- Code cleanup and additional logger information for Devise Registrations (Omniauth) controller

## 0.5.3 (September 30, 2011)

### Enhancements
- Added warning.png image asset

## 0.5.2 (September 19, 2011)

### Bug Fix
- Password reset functionality fixed

## 0.5.1 (September 12, 2011)

### Refactoring
- Removed debug output

### Documentation
- Contour Walkthrough from an empty Rails 3.1 application now works correctly (# Devise.config.sign_out_via = :delete)

## 0.5.0 (September 8, 2011)

### Enhancements
- rails generate contour:install now appends routes
- Authentication icons can be overridden in the application if the application has a contour folder in the assets directory
  - ex: if the web app contains a special logo for LDAP authentication, the app/assets/images/contour folder would contain specialized ldap_64.png and ldap_32.png where 64 and 32 represent the height
- Removing reliance on Contour.application_site_url and using request.script_name instead
- Contour now handles fixes to other libraries in the background, no longer needs to add omniauth_fix.rb and rack_fix.rb to the config/initializers folder

### Bug Fix
- Removed registration page requirement for first_name and last_name
- Incorrect redirect on LDAP authentication failure for Rails apps on subdomains fixed

## 0.4.0 (September 7, 2011)

### Enhancements
- Added new image assets
- :target allowed as a parameter for a link in the menu, ex: target: '_blank'
- Added application_name_html configuration so that users can specify the html for the application name
- :image and :image_options can now be passed to links to specify an image that appears to the right of the link

## 0.3.2 (September 6, 2011)

### Bug Fix
- Fixing asset paths in production and development by restructuring asset (image and stylesheet) relative placement

## 0.3.1 (September 5, 2011)

### Bug Fix
- Fixed assets location for images specified in the stylesheets

## 0.3.0 (September 5, 2011)

### Enhancements
- Update dependencies to Devise 1.4.4, (needed for Rails 3.1.0)
- Menu items are now rendered using html_safe
- Links and menu items can now have a :condition parameter passed to it which is a string that can be evaluated to true or false
  - ex: condition: 'current_user.admin?'

### Testing
- Created limited tests for authentications controller and registrations

## 0.2.1 (September 1, 2011)

### Bug Fix
- Apparently add_dependency doesn't work with (= ) signs either

## 0.2.0 (September 1, 2011)

### Enhancements
- Stock assets added
- Sign in, password reset, and registration pages redesigned

## 0.1.1 (September 1, 2011)

### Bug Fix
- Apparently add_dependency doesn't currently work without ~> Set Omniauth dependency to increment on bug fix revision

## 0.1.0 (September 1, 2011)

### Enhancements
- Contour can now be used as a default template for the application layout
- Contour provides assets, (images, css, and javascript), to provide an easy authentication system built on top of Devise and Omniauth
- Contour provides CSS based on Bluetrip to provide cross-browser compatiblity
- Contour rails generator provides fixes to Rack and Omniauth to allow correct reverse proxy (chaining) authentication to machines behind firewalls

## 0.0.0 (August 29, 2011)

- Skeleton files to compile gem and make it available on rubygems.org
