require 'rails_helper'

RSpec.describe ServiceMailer, type: :mailer do

  describe 'new submission email' do

    let(:user) { double User, email: 'test@emailaddress.com' }
    let(:mail) { described_class.send_invite_email(user, 'http://localhost:3000/') }
    let(:personalisation) { { beacon_url: 'http://localhost:3000/' } }

    it 'sets the recipients'
    
    it 'sets the subject'

    it 'sets the service'



  end
end
