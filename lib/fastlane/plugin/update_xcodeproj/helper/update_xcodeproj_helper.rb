# frozen_string_literal: true
module Fastlane
  module Helper
    class UpdateXcodeprojHelper
      # class methods that you define here become available in your action
      # as `Helper::UpdateXcodeprojHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the update_xcodeproj plugin helper!")
      end
    end
  end
end
