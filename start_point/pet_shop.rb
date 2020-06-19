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