-module(proyecto2).
-export([push/2,pop/1,carte/1,k_esimo/2,random/2,generarlista/2,longitud/1,estavacia/1,reverse/1,isvalid/2,pop_elemento/1,stackinicial/3,inicial/2,hijos/3]).


push(X,L)->[X|L].

pop([])->[];
pop([_H|T])->T.

pop_elemento([])->[];
pop_elemento([H|_T])->H.

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

%isvalid({_A,B},{_X,B})->true;
%isvalid({A,_B},{_X,A})->false;

isvalid({_A,B},{B,_X})->0;
isvalid({_,_},[])->1;
isvalid([],[])->1;
isvalid({_A,_B},{_X,_Y})->1.

%dfs([],S,_N)->S;
%dfs([_H|[]],S,_N)->S;
%%[{1,1} | [{1,2},{1,3},{2,2},{2,3},{3,3}] ]              [{1,2} | [{1,3},{2,2},{2,3},{3,3}] ]
%dfs([H|T],S,N)->push(H,S), case isvalid(H,pop_elemento(T)) of 
%true->A=S,L=pop_elemento(A), push([H|lists:append(L,pop_elemento(T))],S) , dfs([pop_elemento(T),pop(T)],S,N)end. 



stackinicial(A,_L,0)->A++[inicial([],0)];
stackinicial(A,Dom,N)->stackinicial(A++[inicial(Dom,N)],Dom,N-1).
inicial([],_N)->[[]];
inicial([H|_T],1)->[H];
inicial([_H|T],N)->inicial(T,N-1).


dfs_aux(_D,[],_B,L)->L.
dfs_aux(D,[H|T],B,L)-> case longitud(L)=<longitud(H) of
true->Hijos=hijos(H,quita(D,H),[]),s         
%false-> end.

hijos(_L,[],A)->A;
hijos(L,[H|T],A)-> case isvalid(pop_elemento(L),H) of
0->hijos(L,T,lists:append(A,[lists:append(L,[H])]));
1->hijos(L,T,A)end.

quita([],[])->[];
quita([],_E)->[];
quita(_L,[])->[];
quita(L,E)->L--E.


%dfs([],L,_Z)->L;
%dfs([H|T],L,Z)when Z==0->
%C=lists:append(L,lists:append([H],pop_elemento(L))),
%B=lists:delete(H,[H|T]),
%E=dfs(B,L,isvalid(H,pop_elemento(T))),
%Q=lists:append(C,E),
%Q;
%dfs([_H|_T],L,Z)when Z==1->L.

%dfs_w([H|T],L)->dfs([H|T],L,isvalid(H,pop_elemento(T))).
 
%ejemplo([H|T],0)->X=1,ejemplo([H|T],1);
%ejemplo([_H|_T],1)->1.	 

%%[{1,1},{1,2},{1,3},{2,2},{2,3},{3,3}] 	
%recorrer([])->[];
%recorrer([H|T])when isvalid(H,pop_elemento(T)) ->recorrer[H

