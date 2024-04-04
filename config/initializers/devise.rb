# frozen_string_literal: true

Devise.setup do |config|
  # Set the sender email for Devise emails
  config.mailer_sender = 'pychangeric@gmail.com'

  # Custom admin authentication strategy
  config.warden do |manager|
    manager.strategies.add(:admin_authentication) do
      def authenticate!
        if params[:admin]
          admin = Admin.find_by(email: params[:admin][:email])
          if admin && admin.valid_password?(params[:admin][:password])
            success!(admin)
          else
            fail!("Invalid admin credentials")
          end
        else
          fail!("Admin credentials missing")
        end
      end
    end

    manager.default_strategies(scope: :admin).unshift :admin_authentication
  end

  # Define after_sign_up_path_for outside the warden block
  def after_sign_up_path_for(resource)
    admin_dashboard_path
  end

  # ORM configuration (assuming ActiveRecord)
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.expire_all_remember_me_on_sign_out = true
  config.reconfirmable = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  # ==> Hotwire/Turbo configuration
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end
