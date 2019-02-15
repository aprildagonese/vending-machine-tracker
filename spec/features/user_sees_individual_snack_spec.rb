require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they info about that snack' do
    don = Owner.create(name: "Don's")
    dons  = don.machines.create(location: "Don's Mixed Drinks")
    mike = Owner.create(name: "Mike's")
    mikes  = mike.machines.create(location: "Mike's Snacks")
    doritos = Snack.create(name: "Doritos", price: 2.00)
    lays = Snack.create(name: "Lays", price: 1.00)
    sunchips = Snack.create(name: "SunChips", price: 3.00)
    ms1 = MachineSnack.create(machine: dons, snack: doritos)
    ms2 = MachineSnack.create(machine: mikes, snack: doritos)
    ms3 = MachineSnack.create(machine: dons, snack: lays)
    ms4 = MachineSnack.create(machine: mikes, snack: sunchips)

    visit snack_path(doritos)

    expect(page).to have_content("Snack: Doritos")
    expect(page).to have_content("Price: $2.0")
    expect(page).to have_content("Don's Mixed Drinks Average Price: 1.5 Item Count: 2")
    expect(page).to have_content("Mike's Snacks Average Price: 2.5 Item Count: 2")
  end
end
