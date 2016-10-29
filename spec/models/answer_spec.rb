require 'rails_helper'

RSpec.describe Answer, type: :model do
  
    let(:question) {Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) }
    let(:comment) { Answer.create!(body: 'Answer Body') }

    describe "attributes" do
        it "has a body attribute" do
            expect(comment).to have_attributes(body: "Answer Body")
        end
    end
  
  
end
