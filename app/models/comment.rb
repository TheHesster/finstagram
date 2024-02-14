class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :finstagram_post

    validates_presence_of :text, :user, :finstagram_post
    
    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60

        if time_ago_in_minutes >= 1440
            if (time_ago_in_minutes / 1440).to_i == 1
                "#{(time_ago_in_minutes / 1440).to_i} day ago"
            else
                "#{(time_ago_in_minutes / 1440).to_i} days ago"
            end
        elsif time_ago_in_minutes >= 60
            if (time_ago_in_minutes / 60).to_i == 1
                "#{(time_ago_in_minutes / 60).to_i} hour ago"
            else
                "#{(time_ago_in_minutes / 60).to_i} hours ago"
            end
        else
            if time_ago_in_minutes.to_i == 1
                "#{time_ago_in_minutes.to_i} minute ago"
            else
                "#{time_ago_in_minutes.to_i} minutes ago"
            end
        end
    end

end