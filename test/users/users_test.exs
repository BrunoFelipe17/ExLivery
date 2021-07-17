defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Bruno",
          "bruno@leo.com",
          "12345678900",
          22,
          "Rua do Léo"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Bruno", "bruno@leo.com", "1234", 15, "Rua do Leo")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
