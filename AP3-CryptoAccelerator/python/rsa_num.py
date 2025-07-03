import math

# Step 1: Escolha dois números primos
p = 137
q = 241

# Step 2: Calcule n
n = p * q
print("n =", n)

# Step 3: Calcule phi(n)
phi = (p - 1) * (q - 1)

# Step 4: Escolha e tal que 1 < e < phi e mdc(e, phi) = 1
e = 2
while e < phi:
    if math.gcd(e, phi) == 1:
        break
    e += 1

print("e =", e)

# Step 5: Calcule o inverso modular de e (d)
# Isso resolve (d * e) % phi == 1
d = pow(e, -1, phi)
print("d =", d)

# Chaves
print(f'Chave pública: ({e}, {n})')
print(f'Chave privada: ({d}, {n})')

# Mensagem em texto plano 
#A mensagem deve ser menor que n
msg = 14313
print(f'Mensagem original: {msg}')

# Criptografia: C = msg^e mod n
C = pow(msg, e, n)
print(f'Mensagem criptografada: {C}')

# Descriptografia: M = C^d mod n
# M = pow(C, d, n)
# print(f'Mensagem descriptografada: {M}')
