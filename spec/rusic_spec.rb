require 'rusic'
require 'rack/test'

describe Rusic::VERSION do
  it { should match(/\d\.\d\.\d/) }
end

describe Rusic::Server do
  include Rack::Test::Methods

  def app
    Rusic::Server
  end

  it "should respond with success on the homepage" do
    get '/'
    last_response.status.should be(200)
  end
end
