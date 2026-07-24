local Warehouse = {}
Warehouse.__index = Warehouse

function Warehouse:new()
    return setmetatable({
        products = {}
    }, self)
end

function Warehouse:addProduct(name, quantity, price)
    table.insert(self.products, {
        name = name,
        quantity = quantity,
        price = price
    })
end

function Warehouse:totalValue()
    local total = 0

    for _, product in ipairs(self.products) do
        total = total + product.quantity * product.price
    end

    return total
end

function Warehouse:printReport()
    print("Warehouse Report")
    print("================")

    table.sort(self.products, function(a, b)
        return a.name < b.name
    end)

    for _, product in ipairs(self.products) do
        print(string.format(
            "%s | %d units | $%.2f",
            product.name,
            product.quantity,
            product.price
        ))
    end

    print("================")
    print(string.format(
        "Inventory Value: $%.2f",
        self:totalValue()
    ))
end

local warehouse = Warehouse:new()

warehouse:addProduct("Keyboard", 18, 59.90)
warehouse:addProduct("Mouse", 34, 24.50)
warehouse:addProduct("Monitor", 10, 219.99)
warehouse:addProduct("Headset", 15, 79.50)

warehouse:printReport()
