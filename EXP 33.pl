food(apple, fruit, sweet, low_calorie).
food(banana, fruit, sweet, high_calorie).
food(carrot, vegetable, savory, low_calorie).
food(potato, vegetable, savory, high_calorie).
food(chicken, meat, savory, high_protein).
food(fish, seafood, savory, high_protein).
food(spinach, vegetable, savory, high_iron).
food(almonds, nut, savory, high_fat).

diet(heart_disease, [apple, carrot, chicken, fish, almonds]).
diet(diabetes,     [apple, carrot, fish, spinach, almonds]).
diet(anemia,       [spinach, chicken, fish, almonds]).
diet(obesity,      [apple, carrot, fish, spinach]).

suggest_diet(Disease, Diet) :-
    diet(Disease, Diet).
suggest_diet(Disease, Diet) :-
    diet(Disease, AllowedFoods),
    findall(Food, (food(Food, _, _, _), member(Food, AllowedFoods)), Diet).
