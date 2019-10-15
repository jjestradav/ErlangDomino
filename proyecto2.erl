-module(proyecto2).
-export([push/2,pop/1,p26/2,carte/1,k_esimo/2,random/2,generarlista/2]).


push(X,L)->[X|L].

pop([])->[];
pop([_H|T])->T.

k_esimo([H|_T],0)->H;
k_esimo([_H|T],K)->k_esimo(T,K-1).


generarlista([],_N)->[];
generarlista(L,N)->random(carte(L),N).

carte(A)->[{X,Y}||X<-A,Y<-A,X>=Y].


random(_L,0)->[];
random(L,K)->Rand = k_esimo(L,round(rand:uniform()*(length(L)-1))), 
            [Rand|random(L--[Rand],K-1)].





