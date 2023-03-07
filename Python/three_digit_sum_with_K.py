def get_digits(N):
    divider = 1000
    digits = []
    for i in range(3):
        digit = int((N % divider) // (divider / 10))
        digits.append(digit)
        divider /= 10
    return digits

def solution(N, K):
    digits = get_digits(N)
    value = ''
    for i in range(3):
        if K + digits[i] > 9:
            increase = 10 - digits[i] - 1
            K = K - increase
        else:
            increase = K
            K = 0
        if increase > 0:
            digits[i] = digits[i] + increase
    for i in range(len(digits)):
        value += str(digits[i])
    return int(value)
    
print(solution(512, 10))

