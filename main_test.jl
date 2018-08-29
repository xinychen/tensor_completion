include("HaLRTC.jl")
include("mat2ten.jl")
include("ten2mat.jl")

# Load .mat files in Julia.
# Urban traffic speed data set: https://doi.org/10.5281/zenodo.1205228
using MAT
var1 = matread("tensor.mat")
original_tensor = var1["tensor"]
var2 = matread("random_tensor.mat")
random_tensor = var2["random_tensor"]

using PyCall
@pyimport numpy.linalg as ng

# Create a sparse tensor and a binary tensor.
missing_rate = 0.1
binary_tensor = round(random_tensor + 0.5 - missing_rate)
sparse_tensor = original_tensor.*binary_tensor

# HaLRTC: initialization setting.
maxiter = 1000
alpha = ones(length(size(sparse_tensor)))/length(size(sparse_tensor))
rho = 1e-2

tic()
tensor_hat = HaLRTC(sparse_tensor, original_tensor, binary_tensor, alpha, rho, maxiter)
toc()
