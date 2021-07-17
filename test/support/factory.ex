defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Bruno",
      email: "bruno@leo.com",
      cpf: "12345678900",
      age: 22,
      address: "Rua do Léo"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua do Léo",
      items: [
        build(:item),
        build(:item,
          category: :japonesa,
          description: "Temaki de atum",
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "12345678900"
    }
  end
end
