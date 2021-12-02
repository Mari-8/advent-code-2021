require_relative '../../day_2/traveler'
require_relative '../../day_2/command'

RSpec.describe Traveler do 
  subject { Traveler.new } 
  describe "#take_command" do 

    context "when given a up command" do 
      let(:command) { Command.new("up 7") } 

      it "adjusts the travelers aim up" do
        subject.take_command(command) 

        expect(subject.aim).to eq(-7)
      end
    end

    context "when given a down command" do 
      let(:command) { Command.new("down 4") } 

      it "adjusts the travelers aim down" do
        subject.take_command(command) 

        expect(subject.aim).to eq(4)
      end
    end

    context "when given a forward command" do 
      let(:command) { Command.new("forward 3") } 

      it "increases the x" do 

      end

      context "when aim is 0" do 
        subject { Traveler.new(aim: 0)}
        it "does not change the y" do 
          subject.take_command(command) 

          expect(subject.y).to eq(0)
        end
      end

      context "when aim is positive" do 
        subject { Traveler.new(aim: 4)}
        it "increases the y" do 
          subject.take_command(command) 

          expect(subject.y).to eq(12)
        end
      end

      context "when aim is negative" do 
        subject { Traveler.new(aim: -13)}
        it "decreases the y" do 
          subject.take_command(command) 

          expect(subject.y).to eq(-39)
        end
      end
    end
  end
end