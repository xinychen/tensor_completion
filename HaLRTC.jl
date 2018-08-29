function HaLRTC(sparse_tensor, original_tensor, binary_tensor, alpha, rho, maxiter)
    dim = size(sparse_tensor)
    d = length(dim)
    tensor_hat = sparse_tensor
    pos1 = find(1 - binary_tensor)
    ten1 = original_tensor[pos1]
    pos2 = find(ten1)
    Y = Array{Array{Float64}}(d)
    B = Array{Array{Float64}}(d)
    for k = 1:d
        Y[k] = zeros(dim)
        B[k] = zeros(dim)
    end
    println("\nEvaluating HaLRTC (tensor completion) with Julia:\n")
    for iter = 1:maxiter
        for k = 1:d
            u, s, v = ng.svd(ten2mat(tensor_hat + Y[k]/rho, k), full_matrices = 0)
            B[k] = mat2ten(u*diagm(max(s-alpha[k]/rho, 0))*v, k, collect(dim))
        end
        var0 = (sum(B) - sum(Y)/rho)/d
        tensor_hat = (1 - binary_tensor).*var0 + binary_tensor.*sparse_tensor
        for k = 1:d
            Y[k] = Y[k] - rho*(B[k] - tensor_hat)
        end
        ten2 = tensor_hat[pos1]
        rmse = sqrt(sum(((ten1[pos2] - ten2[pos2]).^2)/length(pos2)))
        if mod(iter, 20) == 0
            println("HaLRTC: iterations = $(iter), rmse = $(rmse) km/h.")
        end
    end
    return tensor_hat
end
