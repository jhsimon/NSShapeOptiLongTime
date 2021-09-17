# NSShapeOptiLongTime

This material summarizes the files contained in this folder:

1. macros.edp contains all the macros (except the macros for solving the state solutions) used through out the optimization processes

2. meshes.edp contains the geometries, including the initial domain, the domain where we solved the desired velocity field, and the dummy domain (omega) where the objective function is defined.

3. state_solver.edp has the macros and the finite elements for solving the stationary and instationary Navier-stokes equations, it also includes the schemes on how we solved the deformation fields

4. stationary_opti.edp corresponds to the main optimization loop for solving the stationary optimization problem

5. instationary_opti.edp corresponds to the main optimization loop for solving the time dependent optimization problem, if you want to run this file by itself, there is an option for the length of time, e.g. FreeFem++ --time 4 runs the optimization problem with T=4, and if --time _ is not included the default is T=1

6. matplot.m is a matlab file for visualization

7. runner.edp is an edp file for running all problems, this includes solving for the stationary optimization problem, and the time-dependent problem up to T=512.

8. data folder contains the data points of the boundary and the objective function values.
