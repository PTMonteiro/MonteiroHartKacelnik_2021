# MonteiroHartKacelnik_2021
Code for analysis and figures in Monteiro, Hart and Kacelnik (2021)

"code4figures.m" includes all code needed to generate the all figures presented in the paper (except extended figure 4, see below)

"stats.R" is needed for the statistical analysis and extended figure 4

"rotate&normalizeDATA.m" 1) reads raw x,y position data, 2) rotates to a horizontal plane and normalizes it to a range between [-1 and 1] 
and 3) calculates a preference index based on the difference in euclidean distances between subject and each stimuli, respectively.
