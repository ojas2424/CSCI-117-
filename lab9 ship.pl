% Render the ship term as a nice table.
:- use_rendering(table,
		 [header(s('Ship', 'Leaves at', 'Carries', 'Chimney', 'Goes to'))]).

% Each ship is represented a term, s(S,L,Ca,Ch,G). A list of 5 such terms is a solution.
goes_PortSaid(Goes) :-
	ships(S),
	member(s(Goes,_,_,_,portSaid), S).

carries_tea(Carries) :-
	ships(S),
	member(s(Carries,_,tea,_,_), S).

ships(S) :-
  length(S,5),
  member(s(greek,6,coffee,_,_), S),						%1
  S=[_,_,s(_,_,_,black,_),_,_],							%2
  member(s(english,9,_,_,_), S),						%3
  left(s(french,_,_,blue,_), s(_,_,coffee,_,_), S),		%4
  left(s(_,_,cocoa,_,_), s(_,_,_,_,marseille), S),		%5
  member(s(brazilian,_,_,_,manila), S),					%6
  next(s(_,_,rice,_,_), s(_,_,_,green,_), S),			%7
  member(s(_,5,_,_,genoa), S),							%8
  left(s(_,_,_,_,marseille), s(spanish,7,_,_,_), S),	%9
  member(s(_,_,_,red,hamburg), S),						%10
  next(s(_,7,_,_,_), s(_,_,_,white,_), S),				%11
  border(s(_,_,corn,_,_), S),							%12
  member(s(_,8,_,black,_), S),							%13
  next(s(_,_,corn,_,_), s(_,_,rice,_,_), S),			%14
  member(s(_,6,_,_,hamburg), S),						%15
  member(s(_,_,_,_,portSaid),S),   						%quesa
  member(s(_,_,tea,_,_),S).        						%quesb

% Predicates for capturing relationships in a list of ships, Ls
next(A, B, Ls) :- append(_,[A,B|_], Ls). % A and B are next to one another
next(A, B, Ls) :- append(_,[B,A|_], Ls).

left(A, B, Ls) :- append(_,[A,B|_], Ls).   % A is somewhere to the left of B

border(A, Ls) :- append([A|_],_,Ls).		%A is on the border
border(A, Ls) :- append(_,[A],Ls). 