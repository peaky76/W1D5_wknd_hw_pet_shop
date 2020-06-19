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

def increase_pets_sold(shop, num_of_pets)
    shop[:admin][:pets_sold] += num_of_pets
end

def stock_count(shop)
    return shop[:pets].length()
end

def pets_by_breed(shop, breed)
    pets_matching_breed = []
    for pet in shop[:pets]
        if (pet[:breed] == breed)
            pets_matching_breed << pet
        end
    end
    return pets_matching_breed
end

def find_pet_by_name(shop, pet_name)
    for pet in shop[:pets]
        if (pet[:name] == pet_name)
            return pet
        end
    end
    return nil
end

def remove_pet_by_name(shop, pet_name)
    for pet in shop[:pets]
        if (pet[:name] == pet_name)
            shop[:pets].delete(pet)
        end
    end
end

def add_pet_to_stock(shop, new_pet)
    shop[:pets] << new_pet
end

def customer_cash(customer)
    return customer[:cash]
end

def remove_customer_cash(customer, amount)
    customer[:cash] -= amount
end

def customer_pet_count(customer)
    return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
    customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, pet)
    if (customer[:cash] >= pet[:price])
        return true
    else
        return false
    end
end

def sell_pet_to_customer(shop, pet, customer)
    # If the pet is in the shop
    if (pet != nil && find_pet_by_name(shop, pet[:name]) != nil)
        # If the customer can afford the pet    
        if (customer_can_afford_pet(customer, pet))
            # Take pet out of the shop
            remove_pet_by_name(shop, pet[:name])
            # Give pet to the customer
            add_pet_to_customer(customer, pet)
            # Take cash from the customer
            remove_customer_cash(customer, pet[:price])
            # Give cash to the shop
            add_or_remove_cash(shop, pet[:price])
            # Increase the number of pets sold by 1
            increase_pets_sold(shop, 1)
        end
    end
end     
