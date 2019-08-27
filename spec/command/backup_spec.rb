require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Backup do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ backup }).should.be.instance_of Command::Backup
      end
    end
  end
end

