require "spec_helper"
require "hello"

RSpec.describe Hello do
  describe ".call" do
    it "'Hello World'と返す" do
      expect(Hello.call).to eq("Hello World")
    end
  end
end
