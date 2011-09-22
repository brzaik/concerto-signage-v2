#Use this with a proper crontab entry (the below example runs at midnight each day)
# 0 0 * * * ruby /var/rails/concerto-signage-v2/script/rails runner -e production "SessionCleaner.remove_stale_sessions"

class SessionCleaner
  def self.remove_stale_sessions
    ActiveRecord::SessionStore::Session.
      destroy_all( ['updated_at <?', 1.days.ago] )
    end
end
