class ServiceMailer < ApplicationMailer

    def new_submission
        @service = params[:service]
        User.all.each do |u|
            mail(to: u.email, subject: 'New service awaiting review')
        end
    end

end
