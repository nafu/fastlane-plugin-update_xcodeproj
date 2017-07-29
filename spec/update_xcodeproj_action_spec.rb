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

      allow(Xcodeproj::Project).to receive(:open).with(xcodeproj).and_return(stub_project)
      allow(stub_project).to receive(:objects).and_return(stub_object)
      allow(stub_object).to receive(:select).and_return([stub_configuration])
      allow(stub_configuration).to receive(:build_settings).and_return(stub_settings)
      allow(stub_project).to receive(:save)

      options = { identifier_key => app_identifier }
      Fastlane::Actions::UpdateXcodeprojAction.run(xcodeproj: xcodeproj, options: options)

      expect(stub_settings[identifier_key]).to eq(app_identifier)
    end

    it "presents an error when the key does not exist" do
      stub_project = 'stub project'
      stub_object = ['object']

      allow(Xcodeproj::Project).to receive(:open).with(xcodeproj).and_return(stub_project)
      allow(stub_project).to receive(:objects).and_return(stub_object)
      allow(stub_object).to receive(:select).and_return([])
      allow(stub_project).to receive(:save)

      expect(Fastlane::UI).to receive(:user_error!).with(/Xcodeproj does not use KEY_DOES_NOT_EXIST/)

      options = { 'KEY_DOES_NOT_EXIST' => 'new value' }
      Fastlane::Actions::UpdateXcodeprojAction.run(xcodeproj: xcodeproj, options: options)
    end

    after do
      FileUtils.rm_r(test_path)
    end
  end
end
