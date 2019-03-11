defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five "]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

    # list comprehension is essentially a map

    # method 1
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)

    # method 2
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card ) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)

    # pattern matching is elixir way of variable assignment / in JS - destructuring
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # { status, binary } = File.read(filename)

    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "That file does not exist"
    # end

    # refactor
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term binary
      {:error, _reason } -> "That file does not exist"
    end
  end

  def deal_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # refactor
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
