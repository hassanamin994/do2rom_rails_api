class CleanUpJob < ApplicationJob
  queue_as :default

  def perform
    User.where({'fakes' => {'$gt' => 30}}).delete
  end
end
CleanUpJob.set(wait: 1.hour).perform_later()
