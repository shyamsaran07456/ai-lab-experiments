/* -------------------------------
   MEDICAL DIAGNOSIS SYSTEM
   ------------------------------- */

:- dynamic yes/1, no/1.


/* ---------- KNOWLEDGE BASE ---------- */

disease(flu) :-
    symptom(fever),
    symptom(cough),
    symptom(body_ache),
    symptom(sore_throat).

disease(cold) :-
    symptom(runny_nose),
    symptom(sneezing),
    symptom(sore_throat).

disease(malaria) :-
    symptom(high_fever),
    symptom(headache),
    symptom(chills),
    symptom(sweating).

disease(covid19) :-
    symptom(fever),
    symptom(dry_cough),
    symptom(tiredness),
    symptom(loss_of_taste).

disease(typhoid) :-
    symptom(continuous_fever),
    symptom(abdominal_pain),
    symptom(loss_of_appetite),
    symptom(weakness).


/* ---------- SYMPTOM CHECK ---------- */

symptom(X) :-
    yes(X), !.

symptom(X) :-
    no(X), !, fail.

symptom(X) :-
    ask(X).


/* ---------- ASK USER ---------- */

ask(Symptom) :-
    write('Do you have '),
    write(Symptom),
    write('? (yes/no) : '),
    read(Answer),
    nl,
    check_answer(Answer, Symptom).


check_answer(yes, Symptom) :-
    assertz(yes(Symptom)).

check_answer(no, Symptom) :-
    assertz(no(Symptom)),
    fail.

check_answer(_, Symptom) :-
    write('Please answer only yes or no.'), nl,
    ask(Symptom).


/* ---------- DIAGNOSIS ---------- */

diagnose :-
    disease(Disease), !,
    write('----------------------------------'), nl,
    write(' You may be suffering from: '), write(Disease), nl,
    write('----------------------------------'), nl,
    clear_facts.

diagnose :-
    write('----------------------------------'), nl,
    write(' Disease could not be determined !'),
    nl,
    write('----------------------------------'), nl,
    clear_facts.


/* ---------- CLEAR MEMORY ---------- */

clear_facts :-
    retract(yes(_)), fail.

clear_facts :-
    retract(no(_)), fail.

clear_facts.
