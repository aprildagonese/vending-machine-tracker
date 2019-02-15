require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    it "#average_price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = Snack.create(name: "Doritos", price: 2.00)
      snack2 = Snack.create(name: "Lays", price: 1.50)
      snack3 = Snack.create(name: "SunChips", price: 2.50)
      ms1 = MachineSnack.create(machine: dons, snack: snack1)
      ms2 = MachineSnack.create(machine: dons, snack: snack2)
      ms3 = MachineSnack.create(machine: dons, snack: snack3)

      expect(dons.average_price).to eq(2.00)
    end 
  end
end
