def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number_of_pets)
  shop[:admin][:pets_sold] += number_of_pets
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed_of_pet)
  pets = []
  for animal in shop[:pets]
    if animal[:breed] == breed_of_pet
      pets << animal[:name]
    end
  end
  return pets
end

def find_pet_by_name(shop, pets_name)
  for animal in shop[:pets]
    if animal[:name] == pets_name
      return animal
    end
  end
  return nil
end

def remove_pet_by_name(shop, purchased_pet)
  for animal in shop[:pets]
    if animal[:name] == purchased_pet
      shop[:pets].delete(animal)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
end

def customer_cash(customer_by_index_no)
  return customer_by_index_no[:cash]
end

def remove_customer_cash(customer, amount_spent)
  customer[:cash] -= amount_spent
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  elsif customer[:cash] < new_pet[:price]
    return false
  end
end

def sell_pet_to_customer(shop, pet, customer)
  if pet == nil
    return 0
  elsif customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(shop, pet[:price])
  else
    return 0
  end
end
