"""
    mat2ten(A,n,dims)
    mat2ten(A,R,C,dims)
Fold matrix A into a tensor of dimension dims by mode n or by row and column vectors R and C.
"""
function mat2ten(A::Matrix{T},n::Integer,dims::Vector{D}) where {T<:Number,D<:Integer}
	@assert(dims[n]==size(A,1),"Dimensions mismatch")
	m = setdiff(1:length(dims), n)
	@assert prod(dims[m])==size(A,2)
	X = reshape(A,[dims[n];dims[m]]...)
	permutedims(X,invperm([n;m]))
end

function mat2ten(A::Matrix{T},R::Vector{D},C::Vector{D},dims::Vector{D}) where {T<:Number,D<:Integer}
	@assert(prod(dims[R])==size(A,1) && prod(dims[C])==size(A,2),"Dimensions mismatch")
	X = reshape(A,[dims[R];dims[C]]...)
	permutedims(X,invperm([R;C]))
end
