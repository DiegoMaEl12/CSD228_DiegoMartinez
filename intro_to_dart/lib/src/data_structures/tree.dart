/// Let's break down a commonly known data structure a tree.
///
/// A tree in computer science can be thought of similarly to an actual tree. In
/// fact you use one without thinking about it. Your laptop's filesystem is a tree,
/// branching out via folders and ending at the leaves. One big thing about trees
/// in computer science is that they grow downwards instead.
///
/// So let's breakdown what that means in terms of what types we need to build
/// our own tree.
library;

class Node<T> {
  final T? item;
  final List<Node<T>> children;
  const Node({this.item, this.children = const [], this.previous});

  bool get isRoot => item = null;
  bool get isLeaf => children.isEmpty;
}

/// Now that we have a tree, it would be nice to be able to search through to
/// find a specific value. There are 2 examples are breadth-first search and the
/// other is depth-first search.

/// Searches a tree using the breadth-first search algorithm.
///
/// https://en.wikipedia.org/wiki/Breadth-first_search#Pseudocode
/// ```
/// procedure BFS(G, root) is
///  let Q be a queue
///  label root as explored
///  Q.enqueue(root)
///  while Q is not empty do
///    v := Q.dequeue()
///    if v is the goal then
///      return v
///    for all edges from v to w in G.adjacentEdges(v) do
///      if w is not labeled as explored then
///        label w as explored
///        w.parent := v
///        Q.enqueue(w)
/// ```
// TODO: STUDENT TASK -> Implement breadth-first search.

/// Searches a tree using the depth-first search algorithm.
///
/// While the below example is provided from: https://en.wikipedia.org/wiki/Depth-first_search#Pseudocode
/// there is unfortunately a missing exit condition where if v is the goal (what
/// we're looking for) and have updated the snippet to reflect this.
/// ```
/// procedure DFS_iterative(G, v) is
///  let S be a stack
///  S.push(v)
///  while S is not empty do
///    v = S.pop()
///    if v is the goal then
///      return v
///    if v is not labeled as discovered then
///      label v as discovered
///      for all edges from v to w in G.adjacentEdges(v) do
///        S.push(w)
/// ```
// TODO: STUDENT TASK -> Implement depth-first search.
