require 'rails_helper'

RSpec.describe Question, type: :model do
    # has title: string, body:text and a resolved: boolean - how do you do a boolean?
    let(:question) {Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) }
  
    it "should respond to title" do
        expect(question).to respond_to(:title)
    end
    
    it "should respond to body" do
        expect(question).to respond_to(:body)
    end
    
    it "should respond to resolved" do
        expect(question).to respond_to(:resolved)
    end

end