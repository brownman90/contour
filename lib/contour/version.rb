module Contour
  module VERSION #:nodoc:
    MAJOR = 0
    MINOR = 9
    TINY = 3
    BUILD = nil # nil, "pre", "rc", "rc2"

    STRING = [MAJOR, MINOR, TINY, BUILD].compact.join('.')
  end
end