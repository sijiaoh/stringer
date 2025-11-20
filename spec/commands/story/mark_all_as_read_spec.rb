# frozen_string_literal: true

RSpec.describe MarkAllAsRead do
  it "marks all stories as read exclude keep_unread: true" do
    stories = create_list(:story, 3)
    stories.last.update!(keep_unread: true)

    expect { described_class.call(stories.map(&:id)) }.to change {
      stories.each(&:reload).pluck(:is_read)
    }.from([false, false, false]).to([true, true, false])
  end
end
