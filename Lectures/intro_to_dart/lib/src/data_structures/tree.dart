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

import 'dart:collection';

import 'package:equatable/equatable.dart';

class Node<T> extends Equatable {
  final T? item;
  final Node<T>? previous;

  final List<Node<T>>? connections;
  Node._(this.item, {this.previous, this.connections});

  factory Node({
    required T item,
    Node<T>? previous,
    List<Node<T>>? connections,
}) {
    final node = Node._(item, previous: previous);
    return node.copyWith(
      connections: connections
          ?.map((connection) => connection.copyWith(previous: node))
          .toList(growable: false),
    );
  }
  Node.root(T item) : this._(item);
  bool get isLeaf => connections?.isEmpty ?? true;
  bool get isRoot => previous == null;

  Node<T> copyWith({Node<T>? previous, List<Node<T>>? connections}){
    return Node._(
      item,
      previous: previous ?? this.previous,
      connections: connections ?? this.connections,
      );
  }

  @override
  bool? get stringify => true;
  @override
  List<Object?> get props => [previous, item, connections];
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
extension BFS<T> on Node<T> {
  Node<T>? bfs({required bool Function(Node<T>) predicate}){
    if (isRoot && predicate(this)) {
      return this;
    } else if (connections?.isNotEmpty ?? false) {
      final queue = Queue<Node<T>>();
      final explored = <Node<T>>{};

      queue.add(this);
      explored.add(this);

      while(queue.isNotEmpty) {
        final v = queue.removeFirst();
        if(predicate(v)) {
          return v;
        }
        v.connections?.forEach((connection) {
          if(!explored.contains(connection)) {
            explored.add(connection);
            queue.addLast(connection.copyWith(previous: v));
          }
        });
      }
    }
    return null;
  }
}

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

extension DFS<T> on Node<T> {
  Node<T>? dfs({required bool Function(Node<T>) predicate}){
    final stack = <Node<T>>[];
    final discovered = <Node<T>>{};
    stack.add(this);
    while(stack.isNotEmpty){
      final v = stack.removeLast();
      if(predicate(v)){
        return v;
      }
      if(!discovered.contains(v)){
        discovered.add(v);
        v.connections?.forEach((connection) {
          stack.add(connection.copyWith(previous: v));
        });
      }
    }
    return null;
  }
}
