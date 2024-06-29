import random

class Stock:
    def __init__(self, name, price):
        self.name = name
        self.price = price
    
    def update_price(self):
        change_percent = random.uniform(-0.1, 0.1)  # Stock price changes by +/- 10%
        self.price += self.price * change_percent

class Player:
    def __init__(self, name, cash):
        self.name = name
        self.cash = cash
        self.portfolio = {}

    def buy_stock(self, stock, amount):
        cost = stock.price * amount
        if self.cash >= cost:
            self.cash -= cost
            if stock.name in self.portfolio:
                self.portfolio[stock.name] += amount
            else:
                self.portfolio[stock.name] = amount
            print(f"{self.name} bought {amount} shares of {stock.name} at {stock.price} each.")
        else:
            print(f"{self.name} doesn't have enough cash to buy {amount} shares of {stock.name}.")

    def sell_stock(self, stock, amount):
        if stock.name in self.portfolio and self.portfolio[stock.name] >= amount:
            self.portfolio[stock.name] -= amount
            self.cash += stock.price * amount
            print(f"{self.name} sold {amount} shares of {stock.name} at {stock.price} each.")
        else:
            print(f"{self.name} doesn't have enough shares to sell.")

    def __str__(self):
        return f"{self.name}: Cash: {self.cash}, Portfolio: {self.portfolio}"

def main():
    stocks = [Stock("YaleTech", 100), Stock("BulldogIndustries", 50)]
    players = [Player("Alice", 1000), Player("Bob", 1000)]

    rounds = 10
    for round in range(rounds):
        print(f"\nRound {round + 1}")
        for stock in stocks:
            stock.update_price()
            print(f"{stock.name} new price: {stock.price:.2f}")

        for player in players:
            action = random.choice(["buy", "sell", "hold"])
            stock = random.choice(stocks)
            amount = random.randint(1, 10)
            
            if action == "buy":
                player.buy_stock(stock, amount)
            elif action == "sell":
                player.sell_stock(stock, amount)
            
            print(player)

if __name__ == "__main__":
    main()
