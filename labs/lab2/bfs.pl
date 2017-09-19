succ(1,2).
succ(1,5).
succ(3,1).
succ(2,1).
succ(2,4).
succ(2,3).
succ(2,5).


goal(4).
goal(5).

addAsParent([],Pa,[]).
addAsParent([HL|TL],Pa,Z):-addAsParent(TL,Pa,Z1),append([[HL,Pa]],Z1,Z).

bfsPath(St,P):-bfsPath([St,0],P1,[],[],Caller),append([St],P1,P),Caller=St.
	
bfsPath([St|Pa],P,Q,V,Caller):-goal(St),P=[St],Caller is Pa.

bfsPath([St|Pa],P,Q,V,Caller):-
	not(member(St,V)),
	findall(X,(succ(St,X),not(member(X,V))),Z1),
	append([St],V,V1),
	addAsParent(Z1,St,Z),
	append(Q,Z,[H|T]),
	bfsPath(H,P1,T,V1,Caller1),
	((St=Caller1,
	append([St],P1,P),
	Caller is Pa);append([],Caller1,Caller), append([],P1,P)).
	
	
bfsNoPath(St,P):-bfsNoPath(St,P,[],[]).	
bfsNoPath(St,P,Q,V):-goal(St),P=[St].
bfsNoPath(St,P,Q,V):-not(member(St,V)),findall(X,(succ(St,X),not(member(X,V))),Z),append([St],V,V1),append(Q,Z,[H|T]),bfsNoPath(H,P,T,V1).
