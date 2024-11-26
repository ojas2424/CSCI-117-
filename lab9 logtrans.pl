name([queeNav|X], X, queeNav).
name([kingXavier|X], X, kingXavier).

noun(N, [man|X], X, man(a)).
noun(N, [woman|X], X, woman(a)).
noun(N, [child|X], X, child(a)).

transverb(S,O,[loves|X],X,loves(a,O)).
transverb(S,O,[knows|X], X, knows(a,O)).


intransverb(S,[lives|X],X,lives(a)).
intransverb(S, [runs|X], X, runs(a)).

det(S,P1,P2,[every|X],X, all(a, imply(P1,P2))).
det(S,P1,P2,[exists|X],X, exists(a, and(P1,P2))).

sentence(X0, X, P) :- np(N,P1,X0,X1,P), vp(N,X1,X,P1).


np(N,P1,X0,X,P) :- det(N,P2, P1, X0, X1,P), noun(N,X1,X2,P3), relc(N,P3,X2,X,P2).
np(N,P1,X0,X,P1) :- name(X0,X,N).

vp(S,X0,X,P) :- transverb(S,O,X0,X1,P1),np(O,P1,X1,X,P).
vp(S,X0,X,P2) :- intransverb(S,X0,X,P2).

relc(S,P1,[who|X1],X,and(P1,P2)) :- vp(S,X1,X,P2).
relc(S,P1,X,P1).

%test: sentence([every, man, who, loves, queeNav, lives],[],Form).