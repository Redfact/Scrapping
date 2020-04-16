require_relative "../lib/mairie"

hash = get_all_townhall_emails

describe "get_townhall_email" do
	it "should get return correct mail"do
	expect(get_townhall_email(
		"https://www.annuaire-des-mairies.com/95/avernes.html")).
	to eq("mairie.avernes@orange.fr")
	end
end

describe "get_all_townhall_emails"do
	it "should contain SAGY , SANNOIS , SARCELLES  keys"do
	 expect(hash.key?("SAGY")).to eq(true)
	 expect(hash.key?("SANNOIS")).to eq(true)
	 expect(hash.key?("SARCELLES")).to eq(true)
	end
	it "Provide correct mails "do 
	expect( hash["SAGY"] ).to eq("mairie.sagy@wanadoo.fr")
	expect( hash["ABLEIGES"] ).to eq("mairie.ableiges95@wanadoo.fr")
	end

end