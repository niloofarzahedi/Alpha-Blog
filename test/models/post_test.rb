require "test_helper"

class PostTest < ActiveSupport::TestCase
  fixtures :posts, :users, :subscribers
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    # load a fixture post as an active record object
    post = posts(:post_one)

    # Set post out of stock
    post.update(inventory_count: 0)

    # beacause i only add two subscribers in fixtures i expect two emails to be sent
    assert_emails 2 do
      post.update(inventory_count: 99)
    end
  end
end
