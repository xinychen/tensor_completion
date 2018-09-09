# Tensor Completion
This post introduces a Julia implementation for an efficient low-rank tensor completion algorithm - HaLRTC.
## 1. Fundamentals of tensor completion

* *Tensor unfolding*: convert a higher-order tensor into a matrix along specific direction. (see `ten2mat.jl`)

* *Matrix folding*: convert a matrix into a higher-order tensor with specific direction and size. (see `mat2ten.jl`)

## 2. Tensor completion

* *Data set*: publicly available urban traffic speed data set in Guangzhou, China can be found from https://doi.org/10.5281/zenodo.1205228. In this evaluation, we have organized the original data into a tensor, and there are two `.mat` files, including a data tensor `tensor.mat` and a tensor `random_tensor.mat` with random numbers.

* *Inference*: see paper https://doi.org/10.1109/TPAMI.2012.39.

* *Evaluation*: you can easily accomplish a tensor completion task for missing data imputation by running `main_test.jl`.

If you have any questions, feel free to contact me with following email: chenxy346@mail2.sysu.edu.cn.
