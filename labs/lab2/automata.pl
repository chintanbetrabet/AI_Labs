rem3([X],Z):- Z is mod(X,3).
rem3([H|T],Z):- rem3(T,Z1), Z is mod(2*Z1+H,3).
multipleof3(X):-rem3(X,Z), Z = 0.


finalMod3(0).
mod3Trans(S,[],S):-finalMod3(S).
mod3Trans(S,[Z|T],S1):- Si is mod(2*S+Z,3), mod3Trans(Si,T,S1).
accepts(State,Input):-mod3Trans(State,Input,Value).

hasConsecutiveTrans(0,0,1).
hasConsecutiveTrans(0,1,2).

hasConsecutiveTrans(1,1,2).
hasConsecutiveTrans(1,0,3).

hasConsecutiveTrans(2,1,3).
hasConsecutiveTrans(2,0,1).

hasConsecutiveTrans(3,0,3).
hasConsecutiveTrans(3,1,3).

acceptsConsecutive(3,[]).
acceptsConsecutive(State,[H|T]):- hasConsecutiveTrans(State,H,S1),acceptsConsecutive(S1,T).



