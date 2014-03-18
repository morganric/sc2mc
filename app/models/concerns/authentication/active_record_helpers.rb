module Authentication
  module ActiveRecordHelpers

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def find_for_oauth(auth, user)
        # record = where(provider: auth.provider, uid: auth.uid.to_s).first
        # record || create(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0,20], access_token: auth.credentials.token)
        record = user
        unless auth.provider == 'mixcloud'
          record.provider = auth.provider
          record.uid = auth.uid
          record.access_token = auth.credentials.token
        else
          
        end
        return record
      end
    end
  end
end