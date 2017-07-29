# frozen_string_literal: false

require 'xcodeproj'
include Xcodeproj

describe Fastlane::Actions::UpdateXcodeprojAction do
  describe '#run' do
    let (:test_path) { './tmp/fastlane/tests/fastlane' }
    let (:fixtures_path) { './spec/fixtures/xcodeproj' }
    let (:proj_file) { 'bundle.xcodeproj' }
    let (:identifier_key) { 'PRODUCT_BUNDLE_IDENTIFIER' }

    let (:xcodeproj) { File.join(test_path, proj_file) }
    let (:app_identifier) { 'com.test.plist' }

    before do
      FileUtils.mkdir_p(test_path)
      source = File.join(fixtures_path, proj_file)
      destination = File.join(test_path, proj_file)
      FileUtils.cp_r(source, destination)
    end

    it 'updates the xcode projects when the variables in use' do
      stub_project = 'stub project'
      stub_configuration = 'stub config'
      stub_object = ['object']
      stub_settings = Hash[identifier_key, 'tools.fastlane.bundle']

      expect(Xcodeproj::Project).to receive(:open).with('./tmp/fastlane/tests/fastlane/bundle.xcodeproj').and_return(stub_project)
      expect(stub_project).to receive(:objects).and_return(stub_object)
      expect(stub_object).to receive(:select).and_return([stub_configuration])
      expect(stub_configuration).to receive(:build_settings).and_return(stub_settings)
      expect(stub_project).to receive(:save)

      options = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.test.plist' }
      Fastlane::Actions::UpdateXcodeprojAction.run(xcodeproj: xcodeproj, options: options)

      expect(stub_settings[identifier_key]).to eq(app_identifier)
    end

    after do
      FileUtils.rm_r(test_path)
    end
  end
end
