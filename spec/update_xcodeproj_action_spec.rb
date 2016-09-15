describe Fastlane::Actions::UpdateXcodeprojAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The update_xcodeproj plugin is working!")

      Fastlane::Actions::UpdateXcodeprojAction.run(nil)
    end
  end
end
