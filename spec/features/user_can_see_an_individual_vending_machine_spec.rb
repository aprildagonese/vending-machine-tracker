require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see all snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: "Doritos", price: 2.00)
    snack2 = Snack.create(name: "Lays", price: 1.50)
    snack3 = Snack.create(name: "SunChips", price: 2.50)
    ms1 = MachineSnack.create(machine: dons, snack: snack1)
    ms2 = MachineSnack.create(machine: dons, snack: snack2)
    ms3 = MachineSnack.create(machine: dons, snack: snack3)

    visit machine_path(dons)

    within ".ms-#{ms1.id}" do
      expect(page).to have_content("#{ms1.snack.name}")
      expect(page).to have_content("#{ms1.snack.price}")
    end
    within ".ms-#{ms2.snack.id}" do
      expect(page).to have_content("#{ms2.snack.name}")
      expect(page).to have_content("#{ms2.snack.price}")
    end
    within ".ms-#{ms3.snack.id}" do
      expect(page).to have_content("#{ms3.snack.name}")
      expect(page).to have_content("#{ms3.snack.price}")
    end
  end

  scenario 'they see an average price for snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: "Doritos", price: 2.00)
    snack2 = Snack.create(name: "Lays", price: 1.50)
    snack3 = Snack.create(name: "SunChips", price: 2.50)
    ms1 = MachineSnack.create(machine: dons, snack: snack1)
    ms2 = MachineSnack.create(machine: dons, snack: snack2)
    ms3 = MachineSnack.create(machine: dons, snack: snack3)

    visit machine_path(dons)
    expect(page).to have_content("Average Price: $2.0")
  end
end
