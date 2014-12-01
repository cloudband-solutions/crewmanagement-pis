class ApiKey < ActiveRecord::Base
  validates :access_token, presence: true, uniqueness: true

  before_validation :load_defaults

  private

  def load_defaults
    if self.access_token.blank?
      self.access_token = "#{SecureRandom.hex}"
    end
  end
end
