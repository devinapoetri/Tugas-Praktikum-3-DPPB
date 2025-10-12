import 'dart:io';
import 'dart:math';

class DSU {
  late List<int> parent;
  late List<int> rank;

  DSU(int n) {
    parent = List<int>.generate(n, (i) => i);
    rank = List<int>.filled(n, 0);
  }

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int a, int b) {
    int pa = find(a);
    int pb = find(b);
    if (pa == pb) return;
    if (rank[pa] < rank[pb]) {
      parent[pa] = pb;
    } else if (rank[pa] > rank[pb]) {
      parent[pb] = pa;
    } else {
      parent[pb] = pa;
      rank[pa]++;
    }
  }
}

/// Kelas utama untuk menyelesaikan masalah Gosip Bekatul
class GosipBekatul {
  final int n, m, k;
  final List<int> B;
  final List<int> G;
  final List<List<int>> edges;
  late DSU dsu;

  GosipBekatul(this.n, this.m, this.k, this.B, this.G, this.edges) {
    dsu = DSU(n);
  }

  /// Mengelompokkan bebek ke dalam komponen gosip
  List<List<int>> buildComponents() {
    for (var e in edges) {
      dsu.union(e[0] - 1, e[1] - 1);
    }

    Map<int, List<int>> comps = {};
    for (int i = 0; i < n; i++) {
      int root = dsu.find(i);
      comps.putIfAbsent(root, () => []);
      comps[root]!.add(B[i]);
    }
    return comps.values.toList();
  }

  /// Hitung total ketidakpuasan untuk komponen tertentu dengan bekatul Gx
  int costForComponent(List<int> comp, int g) {
    int total = 0;
    for (var b in comp) {
      total += (b - g).abs();
    }
    return total;
  }

  /// Fungsi utama untuk menyelesaikan perhitungan
  int solve() {
    G.sort();
    var components = buildComponents();
    int total = 0;

    for (var comp in components) {
      comp.sort();
      int median = comp[comp.length ~/ 2];

      // Binary search posisi paling dekat ke median
      int pos = _lowerBound(G, median);

      int best = 1 << 62;
      if (pos < m) best = min(best, costForComponent(comp, G[pos]));
      if (pos - 1 >= 0) best = min(best, costForComponent(comp, G[pos - 1]));
      total += best;
    }

    return total;
  }

  int _lowerBound(List<int> arr, int target) {
    int l = 0, r = arr.length;
    while (l < r) {
      int mid = (l + r) >> 1;
      if (arr[mid] < target) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    return l;
  }
}

void main() {
  List<String> input = stdin.readLineSync()!.split(' ');
  int N = int.parse(input[0]);
  int M = int.parse(input[1]);
  int K = int.parse(input[2]);

  List<int> B = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  List<int> G = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<List<int>> edges = [];
  for (int i = 0; i < K; i++) {
    List<int> line = stdin.readLineSync()!.split(' ').map(int.parse).toList();
    edges.add(line);
  }

  GosipBekatul solver = GosipBekatul(N, M, K, B, G, edges);
  print(solver.solve());
}
