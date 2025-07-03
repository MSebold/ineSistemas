import math

# Funções de mapeamento
def letra_para_numero(c):
    return ord(c.upper()) - ord('A')

def numero_para_letra(n):
    return chr(n + ord('A'))

# Parâmetros do RSA
p = 11
q = 17
n = p * q              # 187
phi = (p - 1) * (q - 1)  # 160
e = 7
d = pow(e, -1, phi)     # inverso de e mod phi

print(f'Chave pública: ({e}, {n})')
print(f'Chave privada: ({d}, {n})')

# Texto original
texto = "Ola"
print(f"Mensagem original: {texto}")

# Criptografar
criptografado = []
for letra in texto:
    m = letra_para_numero(letra)
    c = pow(m, e, n)
    criptografado.append(c)

print(f"Mensagem criptografada (números): {criptografado}")

# Descriptografar
descriptografado = ""
for c in criptografado:
    m = pow(c, d, n)
    letra = numero_para_letra(m)
    descriptografado += letra

print(f"Mensagem descriptografada: {descriptografado}")
