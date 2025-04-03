require "test_helper"

class PostMailerTest < ActionMailer::TestCase
  fixtures :posts, :subscribers
  test "in_stock" do
    mail = PostMailer.with(post: posts(:post_one), subscriber: subscribers(:john_doe)).in_stock
    assert_equal "In stock", mail.subject
    assert_equal [ "john.doe@example.com" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Good news!", mail.body.encoded
  end
end
