planet(mercury, rocky, small, hot, closest_to_sun).
planet(venus,   rocky, small, hot, second_closest_to_sun).
planet(earth,   rocky, medium, temperate, third_closest_to_sun).
planet(mars,    rocky, small, cold, fourth_closest_to_sun).
planet(jupiter, gas_giant, large, cold, fifth_closest_to_sun).
planet(saturn,  gas_giant, large, cold, sixth_closest_to_sun).
planet(uranus,  ice_giant, large, cold, seventh_closest_to_sun).
planet(neptune, ice_giant, large, cold, eighth_closest_to_sun).

planet_properties(Name, Type, Size, Temperature, Position) :-
    planet(Name, Type, Size, Temperature, Position).
