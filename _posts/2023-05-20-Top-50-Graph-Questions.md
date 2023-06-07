---
title: Top 50 Graph Questions
date: 2023-05-16 12:18:18 -500
categories: [GRAPH]
tags: [top-50-graph-question, Imp-graph_questions, DFS, BFS] # tags nams should always be lowercase
---

# Top 50 Graph Problems

Looking to master graph theory and solve graph problems efficiently? You're in the right place! This blog provides solutions to the top 50 graph problems along with multiple approaches for each problem. We also ensure that the written code is well-commented for better understanding.

Graphs are essential data structures used in various fields, including computer science, data analysis, and network analysis. By gaining proficiency in graph theory and problem-solving, you can enhance your skills and tackle complex challenges effectively.

# Graph Problem Heading

## **Print adjacency list**

Given the adjacency list of a bidirectional graph. Your task is to copy/clone the adjacency list for each vertex and return a new list.

## Solution

Discuss the first solution to the graph problem. Explain the approach, algorithm, or technique used in this solution. Provide step-by-step explanations, highlighting any key insights or observations.

### Code (C++)

```cpp
vector<vector<int>> printGraph(int V, vector<int> adj[])
    {

        vector<vector<int>> graph(V);
        int k=0;
        while(k<V)
        {
            graph[k].push_back(k);
            k++;
        }
        for(int i=0;i<V;i++)
        {

            for(int x : adj[i])
            {
                graph[i].push_back(x);
            }
        }
        return graph;
    }
```

## **BFS of graph**

Given a directed graph. The task is to do Breadth First Traversal of this graph starting from 0.

`Note`: One can move from node u to node v only if there's an edge from u to v and find the BFS traversal of the graph starting from the 0th vertex, from left to right according to the graph. Also, you should only take nodes directly or indirectly connected from Node 0 in consideration.

### Solution

```cpp
vector<int> bfsOfGraph(int V, vector<int> adj[])
    {
        // Vector to store the nodes visited in BFS order
        vector<int> nodes;

        // Array to keep track of visited nodes
        int visited[V] = {false};

        // Create a queue for BFS traversal
        queue<int> q;

        // Start BFS from vertex 0
        q.push(0);
        visited[0] = true;


        // Perform BFS traversal
        while (!q.empty())
        {
            int front = q.front();
            nodes.push_back(front);
            q.pop();

            // Traverse all adjacent nodes of the current node
            for (auto node : adj[front])
            {
                // If the adjacent node is not visited, mark it as visited,
                // add it to the visited nodes vector, and enqueue it for further traversal
                if (!visited[node])
                {
                    visited[node] = true;
                    q.push(node);
                }
            }
        }

        // Return the vector containing the nodes visited in BFS order
        return nodes;

    }
```

## **DFS of Graph**

You are given a connected undirected graph. Perform a Depth First Traversal of the graph.
Note: Use a recursive approach to find the DFS traversal of the graph starting from the 0th vertex from left to right according to the graph.

### Solution

```cpp

/*
 * Depth First Traversal (DFS) of a Graph
 *
 * This code implements a recursive approach to perform a Depth First Traversal (DFS) of a connected undirected graph.
 * The DFS traversal starts from the 0th vertex and explores all reachable vertices from each visited vertex.
 * The traversal order is from left to right according to the graph.
 */

#include <vector>
using namespace std;

// Recursive function to perform DFS traversal
void dfsrec(vector<int> adj[], int i, vector<bool>& visited, vector<int>& ans) {
    /* If the current vertex is already visited, return */
    if (visited[i]) {
        return;
    }

    /* Mark the current vertex as visited */
    visited[i] = true;

    /* Add the current vertex to the result */
    ans.push_back(i);

    /* Traverse all adjacent vertices of the current vertex */
    for (int u : adj[i]) {
        /* If the adjacent vertex is not visited, recursively call the DFS function */
        if (!visited[u]) {
            dfsrec(adj, u, visited, ans);
        }
    }
}

// Function to find the DFS traversal of the graph
vector<int> dfsOfGraph(int V, vector<int> adj[]) {
    vector<int> ans;
    vector<bool> visited(V, false);

    /* Traverse all vertices of the graph */
    for (int i = 0; i < V; i++) {
        /* If the current vertex is not visited, call the DFS function */
        if (!visited[i]) {
            dfsrec(adj, i, visited, ans);
        }
    }

    return ans;
}





```

## ** **




### Solution (using BFS)

```cpp
#include <vector>
#include <queue>
using namespace std;

// Breadth-First Search (BFS) function
void bfs(vector<vector<int>>& adj, int V, int N, bool* visited) {
queue<int> q;
visited[N] = true;
q.push(N);


while (!q.empty()) {
    int top = q.front();
    q.pop();
    for (int i = 0; i < V; i++) {
        if (!visited[i] && adj[top][i]) {
            q.push(i);
            visited[i] = true;
        }
    }
}

}

// Function to find the number of provinces in the graph
int numProvinces(vector<vector<int>>& adj, int V) {
bool visited[V] = { false };
int no_of_provinces = 0;



for (int i = 0; i < V; i++) {
    if (!visited[i]) {
        bfs(adj, V, i, visited);
        no_of_provinces++;
    }
}

return no_of_provinces;

}
```
### Solution (using DFS)

```cpp

void dfs(int index, vector<vector<int>> adj, int visited[], int V)
    {
        visited[index] = 1;
        
        for(int i = 0; i < V; i++)
        {
            if(adj[index][i] and visited[i] == 0)
            {
                visited[i] = 1;
                dfs(i, adj, visited, V);
            }
        }
    }
    
    int numProvinces(vector<vector<int>> adj, int V) {
        
        int visited[V] = {0};
        int comp = 0;
        
        for(int i = 0; i < V; i++)
        {
            if(!visited[i])
            {
                comp++;
                dfs(i, adj, visited, V);
            }
        }
        
        return comp;
    }


```

## ***Find the number of islands*

Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of '0's (Water) and '1's(Land). Find the number of islands.

Note: An island is either surrounded by water or boundary of grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.




### Solution

```cpp

int vis[501][501]={{0}};
    int n,m;
    int dx[8] = { -1, 1, 0, 0, -1, -1, 1, 1};
    int dy[8] = {0, 0, -1, 1, -1, 1, -1, 1};
    
    bool val(int r,int c)
    {
        if(r<0 || r>=n || c<0 || c>=m)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    
    void dfs(int r,int c)
    {
        vis[r][c]=1;
        for(int i=0;i<8;i++)
        {
            int nr=r+dx[i];
            int nc=c+dy[i];
            if(val(nr,nc) && vis[nr][nc]==0)
            {
                dfs(nr,nc);
                
            }
        }
    }
    
    int numIslands(vector<vector<char>>& grid)
    {
        // Code here
        n=grid.size();
        m=grid[0].size();
        
        int no_of_island=0;
        
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(grid[i][j]=='0')
                {
                    vis[i][j]=1;
                }
            }
        }
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(!vis[i][j])
                {
                    dfs(i,j);
                    no_of_island++;
                }   
            }
        }
        return no_of_island;
        
    }

```


## Further Improvement / reading

text
