# frozen_string_literal: true

module MarkAllAsRead
  def self.call(story_ids)
    StoryRepository.fetch_by_ids_without_keep_unread(story_ids)
                   .update_all(is_read: true)
  end
end
