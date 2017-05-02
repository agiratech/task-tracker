# frozen_string_literal: true
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '194680066592-8pjc8nu2i0tohr7ek22p9nilvs0qt7kk.apps.googleusercontent.com', 'mYGkLiyXyWO0u6L9aurpI3WJ', access_type: 'online'
end
