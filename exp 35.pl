% Facts: fruit(Name, Color).

fruit(apple, red).
fruit(apple, green).
fruit(banana, yellow).
fruit(grape, purple).
fruit(grape, green).
fruit(orange, orange).
fruit(guava, green).
fruit(mango, yellow).
fruit(mango, orange).
fruit(strawberry, red).

% Rule: Find fruit by color (uses backtracking)
fruit_by_color(Fruit, Color) :- fruit(Fruit, Color).

% Rule: Check if two fruits have the same color
same_color(Fruit1, Fruit2) :-
    fruit(Fruit1, Color),
    fruit(Fruit2, Color),
    Fruit1 \= Fruit2.
