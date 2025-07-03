A = 23
B = 17
N = 97
R = 256
Rinv = pow(R, -1, N)
result = (A * B * Rinv) % N
print(result) 