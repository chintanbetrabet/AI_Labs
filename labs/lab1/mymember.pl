mymember(X,[H|T]):-X=H;mymember(X,T).

bigger(X,[Y]).
bigger(X,[H|T]):-X>H,bigger(X,T).

mylen([ ],0).
mylen([X],1).
mylen([H|T],X):- mylen(T,K), X is 1+K.

myappend(X,[],X).
myappend([],Y,Y).
myappend([H|T],Y,[H| New]):- myappend(T,Y,New).

swapFirstTwo([H1, H2|T],[H2,H1|T]).

isPrefix([],Y).
isPrefix([H|T],[H1|T1]):- isPrefix(T,T1),H = H1.

max(X,Y,Z):- X >= Y , Z is X;Y>X ,Z is Y.
min(X,Y,Z):-X >= Y , Z is Y;Y>X ,Z is X.

gcd(X,Y,Z):-X>=Y ,M is mod(X,Y),(M>0,gcd(Y,M,K),Z is K;Z is Y);M is mod(Y,X),(M>0,gcd(X,M,K),Z is K;Z is X).

rev([],Z,Z).
rev([H|T],Z,Acc) :- rev(T,Z,[H|Acc]).

palin(X):-rev(X,Z,[]),X=Z.

merge([],X,X).
merge(X,[],X).
merge([HA|TA],[HB|TB],C):- HA> HB,merge(TB,[HA|TA],New),append([HB],New,C).
merge([HA|TA],[HB|TB],C):- HB>=HA, merge(TA,[HB|TB],New),append([HA],New,C).

setIntersection([],B,C,C).
setIntersection([HA|TA],B,C,Acc):-member(HA,B),setIntersection(TA,B,C,[HA|Acc]);setIntersection(TA,B,C,Acc).
setIntersection(A,B,C):- setIntersection(A,B,C,[]).

sumList([],0).
sumList([H|T],Y):- sumList(T,Y1),Y is Y1+H.

occursIn(X,Y):- isPrefix(X,Y).
occursIn(X,[H|T]):- occursIn(X,T).

inBoth(A,B,C):- occursIn(A,B),occursIn(A,C).

subset([],B).
subset([HA|TA],B):- member(HA,B),subset(TA,B).

equivalent(A,B):- subset(A,B),subset(B,A).

split([],[],[]).
split([A],A,[]).
split(A,B,C):- half(A,LIM),split(A,B,C,0,LIM).
split([AH|AT],B,C,I,LIM):- Nind is I+1,split(AT,New1,New2,Nind,LIM),(I>=LIM,append([HA],New1,B);append([HA],New2,C)).
half(A,L):-mylen(A,L1),L is L1//2.



