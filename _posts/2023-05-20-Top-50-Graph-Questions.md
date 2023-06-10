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

## **Find the number of islands**

Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of '0's (Water) and '1's(Land). Find the number of islands.

Note: An island is either surrounded by water or boundary of grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.


### **Solution (using BFS)**

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
### **Solution (using DFS)**

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

## **Find the number of islands**

Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of '0's (Water) and '1's(Land). Find the number of islands.

Note: An island is either surrounded by water or boundary of grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.




### **Solution**

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

## **Detect cycle in an undirected graph**

Given an undirected graph with V vertices and E edges, check whether it contains any cycle or not. Graph is in the form of adjacency list where adj[i] contains all the nodes ith node is having edge with.


### **Solution**

```cpp
#include <vector>
using namespace std;

// Depth-First Search (DFS) function
bool dfs(vector<int> adj[], vector<bool>& visited, int source, int parent) {
visited[source] = true;



for (auto node : adj[source]) {
    if (visited[node] == false) {
        if (dfs(adj, visited, node, source)) {
            return true;
        }
    } else if (node != parent) {
        return true;
    }
}

return false;

}

// Function to check whether the graph contains any cycle
bool isCycle(int V, vector<int> adj[]) {
vector<bool> visited(V, false);



for (int i = 0; i < V; i++) {
    if (visited[i] == false) {
        if (dfs(adj, visited, i, -1)) {
            return true;
        }
    }
}

return false;

}

```


## **Hamiltonian Path**

A Hamiltonian path, is a path in an undirected graph that visits each vertex exactly once. Given an undirected graph, the task is to check if a Hamiltonian path is present in it or not.


### **Solution**

```cpp
 bool dfs(int n, vector<int> adj[], vector<int> &vist, int src){
        if(n==0){
            return true;
        }
        vist[src]=1;
        for(auto &x:adj[src]){
            if(vist[x]==0){
                if(dfs(n-1,adj,vist,x)){
                    return true;
                }
            }
        }
        vist[src]=0;
        return false;
    }
    bool check(int N,int M,vector<vector<int>> Edges)
    {
        // code here
        int n= N, m= M;
        vector<int> adj[n];
        
        for(auto &x:Edges){
            adj[x[0]-1].push_back(x[1]-1);
            adj[x[1]-1].push_back(x[0]-1);
        }
        
        vector<int> vist(n,0);
        
        for(int i=0;i<n;i++){
            if(dfs(n-1,adj,vist,i)){
                return true;
            }
        }
        return false;
    }
```

## **Prerequisite Tasks**

There are a total of N tasks, labeled from 0 to N-1. Some tasks may have prerequisites, for example to do task 0 you have to first complete task 1, which is expressed as a pair: [0, 1]
Given the total number of tasks N and a list of prerequisite pairs P, find if it is possible to finish all tasks.


### **Solution**

```cpp
bool isPossible(int N, vector<pair<int, int> >& prerequisites) {
	    // Code here
	    
	    int n = N;
	    
	    vector<vector<int>> graph(n);
        vector<int> indegree(n,0);
        for(auto c : prerequisites)
        {
            graph[c.second].push_back(c.first);
            indegree[c.first]++;
        }
        
        vector<int> toposort;
        queue<int> q;
        for(int i=0;i<n;i++)
        {
            if(indegree[i]==0) 
                q.push(i);
        }
        while(!q.empty())
        {
            int curr = q.front();
            q.pop();
            toposort.push_back(curr);
            
            for(auto nbr: graph[curr])
            {
                indegree[nbr]--;
                if(indegree[nbr]==0) 
                    q.push(nbr);
            }
        }
        if(toposort.size()!=n) 
        	return false;
        	
        return true;
	}
```


## **Course Schedule**
There are a total of n tasks you have to pick, labeled from 0 to n-1. Some tasks may have prerequisites tasks, for example to pick task 0 you have to first finish tasks 1, which is expressed as a pair: [0, 1]
Given the total number of n tasks and a list of prerequisite pairs of size m. Find a ordering of tasks you should pick to finish all tasks.
Note: There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all tasks, return an empty array. Returning any correct order will give the output as 1, whereas any invalid order will give the output "No Ordering Possible".



### **Solution**

```cpp
bool dfs(int i ,vector<vector<int>> &adj,vector<int> &visited , vector<int> &recursive_stack ,stack<int>&answer)
    {
         recursive_stack[i]= true;
         visited[i]=true;
         
        for(auto node: adj[i])
        {
            
            if(!visited[node])
            {
                if(dfs(node,adj,visited,recursive_stack,answer))
                {
                    return true;
                }
                
            }
            else if(recursive_stack[node]==true)
            {
                return true;
            }
            
            
        }
        answer.push(i);
        recursive_stack[i]= false;
        
        return false;
    }
        
    vector<int> findOrder(int n, int m, vector<vector<int>> prerequisites) 
    {
        //code here
        vector<int>ordering;
        vector<int>visited(n,0),recursive_stack(n,0);
	    
	    vector<vector<int>> adj(n);
	    stack<int>answer;
	    
	    // converting the list into adj matrix
	     for (auto& prerequisite : prerequisites) {
            int course = prerequisite[0];
            int prerequisiteCourse = prerequisite[1];
            adj[prerequisiteCourse].push_back(course);
        }
	    
	    
	    // now traversing through adj using dfs
	    
	    for(int i=0;i<n;i++)
	    {
	        if(!visited[i])
	        {
	            if(dfs(i,adj,visited,recursive_stack,answer))
	            {
	                
	                return {};
	            }
	        }
	    }
	    
	    while (!answer.empty()) {
            ordering.push_back(answer.top());
            answer.pop();
        }

        return ordering;
        
        
        
    }
```


## **Circle of strings**
Given an array of lowercase strings A[] of size N, determine if the strings can be chained together to form a circle.
A string X can be chained together with another string Y if the last character of X is same as first
character of Y. If every string of the array can be chained, it will form a circle.

For example, for the array arr[] = {"for", "geek", "rig", "kaf"} the answer will be Yes as the given strings can be chained as "for", "rig", "geek" and "kaf"



### **Solution**

```cpp
void dfs(int node, vector<int> adj[], vector<int> &vis){
     vis[node]=1;
     
     for(auto child: adj[node]){
         if(vis[child]==0){
             dfs(child,adj,vis);
         }
     }
    }
    int isCircle(int N, vector<string> A)
    {
        
        int n= N;
        vector<int> adj[26];
        vector<int> in(26,0), out(26,0);
        
        for(int i=0;i<n;i++){
            int ch1=A[i][0]-'a';
            int ch2=A[i].back()-'a';
            
            adj[ch1].push_back(ch2); //linking all componenets to form a eulerian cycle and test later
            in[ch2]++;
            out[ch1]++;
        }
        
        vector<int> vis(26,0); 
        int src=0;
        
        
        for(int i=0;i<26;i++){
            if(in[i]!=out[i]){
                return 0;
            }
        }
        for(int i=0;i<26;i++){
            if(out[i]!=0){
                src=i;
                break;
            }
        }
        
        dfs(src,adj,vis);
        
        for(int i=0;i<26;i++){
            if(vis[i]==0 && out[i]){
                return 0;
            }
        }
        
        return 1;
    }

```




## ** **




### **Solution**

```cpp

```



## Further Improvement / reading

text
