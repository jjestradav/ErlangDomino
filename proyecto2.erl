-module(proyecto2).
-export([push/2,pop/1,carte/1,k_esimo/2,random/2,generarlista/2,longitud/1,estavacia/1,reverse/1,isvalid/2,pop_elemento/1,stackinicial/3,inicial/2,hijos/3,quita/2,dfs_aux/3,ultimo_elemento/1]).



pop_elemento([])->[];
pop_elemento([H|_T])->H.

k_esimo([H|_T],0)->H;
k_esimo([_H|T],K)->k_esimo(T,K-1).

generarlista([],_N)->[];
generarlista(L,N)->random(carte(L),N).

carte(A)->[{X,Y}||X<-A,Y<-A,X>=Y].


random(_L,0)->[];
random(L,K)->Rand = k_esimo(L,round(rand:uniform()*(length(L)-1))), 
            [Rand|random(L--[Rand],K-1)].

longitud([])->0;
longitud([_H|T])->1+longitud(T).

estavacia([])->true;
estavacia(_A)->false.

reverse({H,T})->{T,H}.


isvalid({_A,B},{B,_X})->0;
isvalid({_,_},[])->1;
isvalid([],[])->1;
isvalid({_A,_B},{_X,_Y})->1;
isvalid([],{_,_})->1.


stackinicial(A,_L,0)->A++[inicial([],0)];
stackinicial(A,Dom,N)->stackinicial(A++[inicial(Dom,N)],Dom,N-1).
inicial([],_N)->[[]];
inicial([H|_T],1)->[H];
inicial([_H|T],N)->inicial(T,N-1).


hijos([],_L,A)->A;
hijos([X|Y],U,A)-> case isvalid(ultimo_elemento(U),X) of
0->hijos(Y,U,lists:append(A,[lists:append(U,[X])]));
1->hijos(Y,U,A)end.

dfs_aux(_D,[],L)->L;
dfs_aux(D,[H|T],L)->case longitud(L)=<longitud(H) of
true->dfs_aux(D,hijos(quita(D,H),H,[])++T,H);        
false->dfs_aux(D,hijos(quita(D,H),H,[])++T,L) end.

ultimo_elemento([T])->T;
ultimo_elemento([_H|T])->ultimo_elemento(T).


quita(L,E)->L--E.


