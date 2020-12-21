/*****************************************************************************

		Copyright (c) My Company

 Project:  Tree Example
 FileName: Tree.PRO
 Purpose: An example on how to wprk with trees in prolog
 Written by: Visual Prolog
 Comments:
******************************************************************************/

domains
  chartree = tree(char, chartree, chartree); empty

predicates
  nondeterm do(chartree) 
  action(char,chartree,chartree) 
  create_tree(chartree,chartree) 
  insert(char,chartree,chartree) 
  write_tree(chartree)
  count_Tree(chartree,integer) 
  nondeterm repeat 
clauses
  do(Tree):-
	repeat,nl,
	write("******************************"),nl,
	write("Enter 1 to update tree\n"),
	write("Enter 2 to show tree\n"),
	write("Enter 3 to count nodes in tree\n"),
	write("Enter 7 to exit\n"),
	write("******************************"),nl,
	write("Enter number - "),
	readchar(X),nl,
	action(X, Tree, NewTree),
	do(NewTree).
action('1',Tree,NewTree):-
	write("Enter characters or # to end: "),
	create_Tree(Tree, NewTree).
  action('2',Tree,Tree):-
	write_Tree(Tree),
	write("\nPress a key to continue"),
	readchar(_),nl.
  action('3',Tree,Tree):-
	count_Tree(Tree,Count),
	write("Number of nodes in tree = "),
	write(Count),nl,
	write("\nPress a key to continue"),
	readchar(_),nl.
  action('7', _, empty):-
	exit.
create_Tree(Tree, NewTree):-
	readchar(C),
	C<>'#',!,
	write(C, " "),
	insert(C, Tree, TempTree),
	create_Tree(TempTree, NewTree).
	create_Tree(Tree, Tree).

insert(New,empty,tree(New,empty,empty)):-!.

  insert(New,tree(Element,Left,Right),tree(Element,NewLeft,Right)):-
	New<Element,!,
	insert(New,Left,NewLeft).

  insert(New,tree(Element,Left,Right),tree(Element,Left,NewRight)):-
	insert(New,Right,NewRight).


write_Tree(empty).
write_Tree(tree(Item,Left,Right)):-
	write_Tree(Left),
	write(Item, " "),
	write_Tree(Right).

count_Tree(empty,0):-!.

count_Tree(tree(_,Left,Right),Count):- 
	count_Tree(Left,CountL),
	count_Tree(Right,CountR),
	Count=CountL+CountR+1.
repeat.
repeat:-repeat.
  
GOAL
  write("*************** Character tree sort *******************"),nl,
  do(empty).
