require 'rspec/autorun'

# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces. /////////// DONE

# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period. /// Done

# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters. /// Done
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end
  # Returns the string while first-- removing all the whitespace on both ends of string
  # 
  def full_name
    squish("#{@first_name} #{@middle_name} #{@last_name}")
  end

  def full_name_with_middle_initial
    # middle name is made into initial if it exists
    squish("#{@first_name} #{@middle_name[0] if @middle_name} #{@last_name}")    
  end

  def initials
    squish("#{@first_name[0]} #{@middle_name[0] if @middle_name} #{@last_name[0]}")
  end

  def squish(s)
    s.strip.gsub(/\s+/, " ")
  end

end


RSpec.describe Person do
  # define objects below 
  let(:person_with_middle_name) {Person.new(first_name: "Gabriel", middle_name: "Enrique", last_name: "Betancourt")}
  let(:person_without_middle_name){Person.new(first_name: "Gabriel", last_name: "Betancourt")}

  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do 
      expect(person_with_middle_name.full_name).to eq("Gabriel Enrique Betancourt")
    end

    it "does not add extra spaces if middle name is missing" do 
      expect(person_without_middle_name.full_name).to eq("Gabriel Betancourt")
    end 
  end

  describe "#full_name_with_middle_initial" do 
    it "concatenates first name, middle name initial, and last name with spaces" do
      expect(person_with_middle_name.full_name_with_middle_initial).to eq("Gabriel E Betancourt")
    end

    it "does not add extra spaces if middle name is missing" do
      expect(person_without_middle_name.full_name_with_middle_initial).to eq("Gabriel Betancourt")
    end
  end

  describe "#initials" do 
    it "concatenates first name initial, middle name initial, and last name initial with spaces" do 
       expect(person_with_middle_name.initials).to eq("G E B")
    end
    it "does not extra spaces if middle initial is missing" do 
      expect(person_without_middle_name.initials).to eq("G B")
    end
  end
end