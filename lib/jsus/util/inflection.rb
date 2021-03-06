module Jsus
  module Util
    # Various inflection helpers
    module Inflection
      class <<self
        # Converts strings with various punctuation to pascal case
        # @example
        #     hello_world  => HelloWorld
        #     Oh.My.God    => OhMyGod
        #     iAmCamelCase => IAmCamelCase
        #     some_Weird_._punctuation => SomeWeirdPunctuation
        # @api public
        def random_case_to_mixed_case(string)
          string.split(/[^a-zA-Z]+/).map {|chunk| capitalize(chunk) }.join
        end # random_case_to_mixed_case

        # Same as #random_case_to_mixed_case, but preserves dots
        # @example
        #     color.fx => Color.Fx
        # @api public
        def random_case_to_mixed_case_preserve_dots(string)
          string.split(".").map {|c| random_case_to_mixed_case(c) }.join(".")
        end # random_case_to_mixed_case

        # Capitalizes first letter (doesn't do anything else to other letters, unlike String#capitalize)
        # @api public
        def capitalize(string)
          string[0,1].capitalize + string[1..-1].to_s
        end # capitalize

        # Downcases first letter
        # @api public
        def decapitalize(string)
          string[0,1].downcase + string[1..-1].to_s
        end # decapitalize

        # Translates MixedCase string to camel-case
        # @api public
        def snake_case(string)
          decapitalize(string.gsub(/(.)([A-Z])([a-z]+)/) {|_| "#{$1}_#{$2.downcase}#{$3}"}.
                              gsub(/[^A-Za-z_]+/, "_"))
        end # snake_case
      end # class <<self
    end # module Inflection
  end # module Util
end # module Jsus
