-module(proyecto2).
-export([push/2,pop/1,carte/1,k_esimo/2,random/2,generarlista/2,longitud/1,estavacia/1,reverse/1,compare/2]).


push(X,L)->[X|L].

pop([])->[];
pop([_H|T])->T.

k_esimo([H|_T],0)->H;
k_esimo([_H|T],K)->k_esimo(T,K-1).


generarlista([],_N)->[];
generarlista(L,N)->random(carte(L),N).
%generarlista(L,N)->carte(random(L,N)).

carte(A)->[{X,Y}||X<-A,Y<-A,X>=Y].


random(_L,0)->[];
random(L,K)->Rand = k_esimo(L,round(rand:uniform()*(length(L)-1))), 
            [Rand|random(L--[Rand],K-1)].

longitud([])->0;
longitud([_H|T])->1+longitud(T).

estavacia([])->true;
estavacia(_A)->false.

reverse({H,T})->{T,H}.

compare({A,B},{B,A})->[{A,B},{B,A}].


