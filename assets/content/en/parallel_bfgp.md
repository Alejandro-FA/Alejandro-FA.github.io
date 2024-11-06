# Parallel Strategies for Best-First Generalized Planning

#### Abstract

In recent years, there has been renewed interest in closing the performance gap between state-of-the-art planning solvers and generalized planning (GP), a research area of AI that studies the automated synthesis of algorithmic-like solutions capable of solving multiple classical planning instances. One of the current advancements has been the introduction of Best-First Generalized Planning (BFGP), a GP algorithm based on a novel solution space that can be explored with heuristic search, one of the foundations of modern planners. This paper evaluates the application of parallel search techniques to BFGP, another critical component in closing the performance gap. We first discuss why BFGP is well suited for parallelization and some of its differentiating characteristics from classical planners. Then, we propose two simple shared-memory parallel strategies with good scaling with the number of cores.

#### References

- _[1]_ D. E. Baz, B. Fakih, R. S. Nigenda, and V. Boyer. Parallel best-first
  search algorithms for planning problems on multi-core processors. The
  Journal of supercomputing, 78(3):3122–3151, 7 2021.

- _[2]_ B. Bonet and H. Geffner. Planning as heuristic search. Artificial Intelligence, 129(1):5–33, 2001.

- _[3]_ M. Ghallab, D. Nau, and P. Traverso. Automated Planning and Acting. Cambridge University Press, 2016.

- _[4]_ P. Haslum, N. Lipovetzky, D. Magazzeni, and C. Muise. An introduction to the planning domain definition language, volume 13. Springer, 2019.

- _[5]_ Y. Hu and G. De Giacomo. Generalized planning: Synthesizing plans that work for multiple environments. In IJCAI, volume 22, page 918, 2011.

- _[6]_ S. Jiménez, J. Segovia-Aguas, and A. Jonsson. A review of generalized planning. The Knowledge Engineering Review, 34:e5, 2019.

- _[7]_ A. Kishimoto, A. Fukunaga, and A. Botea. Scalable, parallel best-first search for optimal sequential planning. ICAPS, 19(1):201–208, Oct. 2009.

- _[8]_ R. E. Korf, W. Zhang, I. Thayer, and H. Hohwald. Frontier search. Journal of the ACM (JACM), 52(5):715–748, 2005.

- _[9]_ R. Kuroiwa and A. Fukunaga. On the Pathological Search Behavior of Distributed Greedy Best-First Search. ICAPS, 29:255–263, 5 2021.

- _[10]_ J. Segovia Aguas, S. Jimenez Celorrio, and A. Jonsson. Generalized planning with procedural domain control knowledge. ICAPS, 26(1): 285–293, Mar. 2016.

- _[11]_ J. Segovia-Aguas, S. Jiménez, and A. Jonsson. Generalized planning as heuristic search. ICAPS, 31(1):569–577, May 2021.

- _[12]_ J. Segovia-Aguas, Y. E-Martín, and S. Jiménez. Representation and Synthesis of C++ Programs for Generalized Planning, 2022.

- _[13]_ J. Segovia-Aguas, S. Jiménez, and A. Jonsson. Generalized Planning as Heuristic Search: A new planning search-space that leverages pointers over objects. Artificial Intelligence, page 104097, 2 2024.

- _[14]_ S. Srivastava. Foundations and applications of generalized planning. AI Communications, 24(4):349–351, 2011.

- _[15]_ S. Srivastava, N. Immerman, and S. Zilberstein. A new representation and associated algorithms for generalized planning. Artificial Intelligence, 175(2):615–647, 2011.

- _[16]_ A. Taitler, R. Alford, J. Espasa, G. Behnke, D. Fišer, M. Gimelfarb, F. Pommerening, S. Sanner, E. Scala, D. Schreiber, et al. The 2023 international planning competition. AI Magazine, pages 453–460, 2024
