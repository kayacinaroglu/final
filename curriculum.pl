/* ----------------------- */
/* -------- FACTS -------- */
/* ----------------------- */
fall(cs15).
fall(cs17).
fall(cs33).
fall(cs141).
fall(cs126).

spring(cs16).
spring(cs18).
spring(cs22).
spring(cs32).
spring(cs166).

has_prereqs(cs16, cs15).
has_prereqs(cs33, cs16).
has_prereqs(cs33, cs18).
has_prereqs(cs18, cs17).
has_prereqs(cs32, cs16).
has_prereqs(cs32, cs18).
has_prereqs(cs141, cs16).
has_prereqs(cs141, cs22).
has_prereqs(cs141, cs18).
has_prereqs(cs126, cs32).
has_prereqs(cs126, cs22).
has_prereqs(cs166, cs33).

no_prereqs(cs15).
no_prereqs(cs22).
no_prereqs(cs17).

has_taken(mark, cs17).
has_taken(mark, cs18).
has_taken(mark, cs32).

has_taken(elon, cs17).
has_taken(elon, cs15).
has_taken(elon, cs16).

has_taken(sheryl, cs22).
has_taken(sheryl, cs32).
has_taken(sheryl, cs33).
has_taken(sheryl, cs15).
has_taken(sheryl, cs16).
has_taken(sheryl, cs17).
has_taken(sheryl, cs18).

has_taken(jeff, cs33).
has_taken(jeff, cs18).
has_taken(jeff, cs17).
has_taken(jeff, cs166).



/* ----------------------- */
/* -------- RULES -------- */
/* ----------------------- */

intro(Course) :- no_prereqs(Course), fall(Course).
intro(Course) :- spring(Course), has_prereqs(Course, Prerequisites), member(Prerequisite, Prerequisites), intro(Prerequisite).
intermediate(Course) :- has_prereqs(Course, Prerequisites), member(Prerequisite, Prerequisites), intro(Prerequisite), not(intro(Course)).
upper_level(Course) :- has_prereqs(Course, Prerequisites), member(Prerequisite, Prerequisites), not(intro(Prerequisite)); member(cs22, Prerequisites). 
can_take(Student, Course) :- has_taken(Student, Prerequisite), has_prereqs(Course, Prerequisites), member(Prerequisite,Prerequisites).

/*intermediate doesn't work and I couldn't figure it out
the same is the case for can_take, I'm probably missing something crucial
queries that don't involve these functions seem to be working correctly

since can_take doesn't work probably none of the query questions will yield correct results unfortunately but you can look at my code and see where it went wrong.*/