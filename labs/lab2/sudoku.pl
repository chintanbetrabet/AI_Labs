
row(1,[_,_,_,_]).
row(2,[2,3,_,_]).
row(3,[_,_,4,2]).
row(4,[_,_,_,_]).

sud_goal([R1,R2,R3,R4]):- 
% Unify with input to ensure that generated permutaion satisfies initial config
row(1,R1),
row(3,R3),
row(2,R2),
row(4,R4),

R1=[A1,A2,A3,A4],
R2=[B1,B2,B3,B4],
R3=[C1,C2,C3,C4],
R4=[D1,D2,D3,D4],

permutation(R1,[1,2,3,4]),
permutation(R2,[1,2,3,4]),
permutation(R3,[1,2,3,4]),
permutation(R4,[1,2,3,4]),

permutation([A1,B1,C1,D1],[1,2,3,4]),
permutation([A2,B2,C2,D2],[1,2,3,4]),
permutation([A3,B3,C3,D3],[1,2,3,4]),
permutation([A4,B4,C4,D4],[1,2,3,4]),


permutation([A1,B1,A2,B2],[1,2,3,4]),
permutation([A3,B3,A4,B4],[1,2,3,4]),
permutation([C1,D1,C2,D2],[1,2,3,4]),
permutation([C3,D3,C4,D4],[1,2,3,4]).

