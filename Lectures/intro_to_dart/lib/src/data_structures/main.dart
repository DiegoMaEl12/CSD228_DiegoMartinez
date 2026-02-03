import './tree.dart';

void main(){
  final tree = Node(
    item: 1,
    connections: [
      Node(item: 2),
      Node(item: 3, connections: [
        Node(item:4),
        Node(item:5),
      ]),
    ],
  );
  final dfsResult = tree.dfs(predicate: (node) => node.item == 5);
  print('DFS found: ${dfsResult?.item}');
  final bfsResult = tree.bfs(predicate: (node) => node.item == 5);
  print('BFS found: ${bfsResult?.item}');
}