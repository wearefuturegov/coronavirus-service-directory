class ServiceMailer < ApplicationMailer

    def new_submission
        @service = params[:service]
        User.where(admin: true).each do |u|
            mail(to: u.email, subject: 'New service awaiting review')
        end
    end

end
