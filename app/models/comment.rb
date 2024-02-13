class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :finstagram_post

    validates_presence_of :text, :user, :finstagram_post
    
    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60

        if time_ago_in_minutes >= 60
            "#{(time_ago_in_minutes / 60).to_i} hours ago"
        else
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
    end

end