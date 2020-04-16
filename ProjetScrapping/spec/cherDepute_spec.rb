require_relative "../lib/cherDepute"


hash = get_deputes_mails

describe "get_depute_email" do
	it "should return correct mail"do
	expect(get_depute_email(
		"http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719146")).
	to eq("jean-felix.acquaviva@assemblee-nationale.fr")
	end
end

describe "get_all_townhall_emails"do
	it "should contain M. Damien Abad , M. Patrice Anato   keys"do
	 expect(hash.key?("M. Damien Abad")).to eq(true)
	 expect(hash.key?("M. Patrice Anato")).to eq(true)
	end
	it "Provide correct mails "do 
	expect( hash["M. Saïd Ahamada"] ).to eq("said.ahamada@assemblee-nationale.fr")
	expect( hash["Mme Emmanuelle Anthoine"] ).to eq("emmanuelle.anthoine@assemblee-nationale.fr")
	end

end