% Sample graph represented as edges with weights
edge(a, b, 5).
edge(a, c, 3).
edge(b, d, 2).
edge(c, d, 6).
edge(c, e, 4).
edge(d, e, 1).

% Best-First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search(Start, Goal, [Start], 0, Path).

best_first_search(Node, Node, Path, _Cost, Path).
best_first_search(Current, Goal, Path, Cost, ResultPath) :-
    % Find all edges from the current node
    findall(NextNode-CostToNext, (edge(Current, NextNode, CostToNext), \+ member(NextNode, Path)), NextNodes),
    % Sort the edges based on the cost to next node
    keysort(NextNodes, SortedNextNodes),
    % Take the lowest cost edge
    member(NextNode-CostToNext, SortedNextNodes),
    NewCost is Cost + CostToNext,
    best_first_search(NextNode, Goal, [NextNode|Path], NewCost, ResultPath).



%best_first_search(a, e, Path).