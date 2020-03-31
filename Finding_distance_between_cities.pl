flight(istanbul,rize).
flight(istanbul,van).
flight(istanbul,ankara).
flight(istanbul,gaziantep).
flight(istanbul,antalya).
flight(istanbul,izmir).

flight(rize,istanbul).
flight(rize,van).

flight(van,rize).
flight(van,istanbul).
flight(van,ankara).

flight(ankara,van).
flight(ankara,istanbul).
flight(ankara,konya).

flight(konya,ankara).
flight(konya,antalya).

flight(gaziantep,istanbul).
flight(gaziantep,antalya).

flight(antalya,gaziantep).
flight(antalya,konya).
flight(antalya,istanbul).

flight(izmir,istanbul).
flight(izmir,isparta).

flight(isparta,izmir).
flight(isparta,burdur).

flight(burdur,isparta).

flight(edirne,edremit).

flight(edremit,edirne).
flight(edremit,erzincan).

flight(erzincan,edremit).

distance(istanbul,rize,967).
distance(istanbul,van,1262).
distance(istanbul,ankara,351).
distance(istanbul,gaziantep,847).
distance(istanbul,antalya,482).
distance(istanbul,izmir,328).

distance(rize,istanbul,967).
distance(rize,van,373).

distance(van,rize,373).
distance(van,istanbul,1262).
distance(van,ankara,920).

distance(ankara,van,920).
distance(ankara,istanbul,351).
distance(ankara,konya,227).

distance(konya,ankara,227).
distance(konya,antalya,192).

distance(gaziantep,istanbul,847).
distance(gaziantep,antalya,592).

distance(antalya,gaziantep,592).
distance(antalya,konya,192).
distance(antalya,istanbul,482).

distance(izmir,istanbul,328).
distance(izmir,isparta,308).

distance(isparta,izmir,308).
distance(isparta,burdur,24).

distance(burdur,isparta,24).

distance(edirne,edremit,914).

distance(edremit,edirne,914).
distance(edremit,erzincan,736).

distance(erzincan,edremit,736).

route(X,Y) :- flight(X,Y).
route(X,Y) :- path(X,Y,[]).

droute(X,Y,Z) :- path(X,Y,[X],_,Z).

path(X,Y,Z) :- flight(X,T) , not(member(T,Z)) ,(Y = T ; path(T,Y,[X|Z])).

path(X,Y,P,[Y|P],Z) :- flight(X,Y), distance(X,Y,Z),!.

path(X,Y,V,P,Z) :- flight(X,T), not(T == Y), not(member(T,V)), distance(X,T,Old_Z), path(T,Y,[T|V],P,New_Z), Z is Old_Z + New_Z.
