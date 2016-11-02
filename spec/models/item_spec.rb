require 'rails_helper'

describe Item do
    describe "attributes" do
        let(:item) {
            Item.create!(h1: "Welcome to ingur",
            h2: "Mackerel is a fish",
            h3: "Christmas is coming",
            href: "http://www.santa-claus.com")
        }
        it "requires h1 to be present" do
            expect { item.update(:h1, ' ') }.to raise_error(ArgumentError)
        end
        it "requires h2 to be present" do
            expect { item.update(:h2, ' ') }.to raise_error(ArgumentError)
        end        
        it "requires h3 to be present" do
            expect { item.update(:h3, ' ') }.to raise_error(ArgumentError)
        end        
        it "requires href to be present" do
            expect { item.update(:href, ' ') }.to raise_error(ArgumentError)
        end
    end
    
    it "must have h1 attribute" do
      item = Item.new(h1: " ", h2: "Mackerel is a fish", h3: "Christmas is coming", href: "http://www.santa-claus.com" )
      expect(item).to_not be_valid
      expect(item.errors[:h1]).to eq(["can't be blank"])
    end
    it "must have h2 attribute" do
      item = Item.new(h1: "Welcome to ingur", h2: " ", h3: "Christmas is coming", href: "http://www.santa-claus.com" )
      expect(item).to_not be_valid
      expect(item.errors[:h2]).to eq(["can't be blank"])
    end  
    it "must have h3 attribute" do
      item = Item.new(h1: "Welcome to ingur", h2: "Mackerel is a fish", h3: " ", href: "http://www.santa-claus.com" )
      expect(item).to_not be_valid
      expect(item.errors[:h3]).to eq(["can't be blank"])
    end
    it "must have href attribute" do
      item = Item.new(h1: "Welcome to ingur", h2: "Mackerel is a fish", h3: "Christmas is coming", href: " " )
      expect(item).to_not be_valid
      expect(item.errors[:href]).to eq(["can't be blank"])
    end    
end