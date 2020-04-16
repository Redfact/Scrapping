require_relative "../lib/darktrader"

describe "Get_crypto_name" do
	it "should get 200 names"do
	expect(get_crypto_name().size).to eq(200)
	end
end

describe "get_crypto_has"do
	it "should contain Bitcoin,XRP"do
	 expect(get_crypto_hash.key?("Bitcoin")).to eq(true)
	 expect(get_crypto_hash.key?("XRP")).to eq(true)
	 expect(get_crypto_hash.key?("WAX")).to eq(true)
	end

end