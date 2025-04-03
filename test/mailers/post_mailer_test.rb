require "test_helper"

class PostMailerTest < ActionMailer::TestCase
  test "in_stock" do
    mail = PostMailer.in_stock
    assert_equal "In stock", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
