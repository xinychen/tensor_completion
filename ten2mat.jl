"""
    ten2mat(X,n)
Mode-n matricization of a tensor or matricization by row and column vectors R and C.
"""
function ten2mat(X::Array{T,N},n::Integer) where {T<:Number,N}
    # https://github.com/Jutho/TensorOperations.jl

	@assert(n<=ndims(X),"Mode exceedes number of dimensions")
	sz=size(X)
	m=setdiff(1:N,n)
	reshape(permutedims(X,[n;m]),sz[n],prod(sz[m]))
end
