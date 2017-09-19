succ(1,2).
succ(1,5).
succ(3,1).
succ(2,1).
succ(2,4).
succ(2,3).
succ(2,5).



goal(4).
goal(5).
dfs(X,P,V,D):- D>=0,goal(X),P=[X].
dfs(St,P,V,D):-
	D>=0,succ(St,Su),not(member(Su,V)),append([St],V,V1),D1 is D+1,dfs(Su,P1,V1,D1),P=[St|P1].
dfs(St,P,MD):- dfs(St,P,[],MD).


