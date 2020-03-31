element(E,S):- member(E,S).

equivalent([],[]).
equivalent([ES1|S1],[ES2|S2]) :- ES1==ES2, equivalent(S1,S2).

union(S1,[],S3):- equivalent(S1,S3).
union(S1,[ES2|S2],S3):- element(ES2,S3), delete(S3,ES2,NS3), union(S1,S2,NS3),!.

intersect(_,[],[]).
intersect(S1,[ES2|S2],S3):- element(ES2,S1),element(ES2,S3), delete(S3,ES2,NS3), intersect(S1,S2,NS3),!.
intersect(S1,[ES2|S2],S3):- not(element(ES2,S1)), intersect(S1,S2,S3),!.