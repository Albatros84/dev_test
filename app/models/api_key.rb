class ApiKey < ActiveRecord::Base
  before_create :generate_access_token

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

end

# curl http://localhost:3000/private_api/ -I
# curl 'http://localhost:3000/private_api/v1/locations/PL?access_token=1234' -I
# curl http://localhost:3000/private_api/ -H 'Authorization: Token access_token="c576f0136149a2e2d9127b3901015545"'
