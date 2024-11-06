# Parallel Strategies for Best-First Generalized Planning

#### Abstract

In recent years, there has been renewed interest in closing the performance gap between state-of-the-art planning solvers and generalized planning (GP), a research area of AI that studies the automated synthesis of algorithmic-like solutions capable of solving multiple classical planning instances. One of the current advancements has been the introduction of Best-First Generalized Planning (BFGP), a GP algorithm based on a novel solution space that can be explored with heuristic search, one of the foundations of modern planners. This paper evaluates the application of parallel search techniques to BFGP, another critical component in closing the performance gap. We first discuss why BFGP is well suited for parallelization and some of its differentiating characteristics from classical planners. Then, we propose two simple shared-memory parallel strategies with good scaling with the number of cores.
