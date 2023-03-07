def solution(A):
    A.sort()
    A = list(set(A))
    smallest_positive = 1
    if smallest_positive == A[-1]:
        return smallest_positive + 1
    for i in range(len(A)):
        if A[i] < 0 or smallest_positive == 0:
            continue
        elif smallest_positive == A[i]:
            smallest_positive += 1
        else:
            return smallest_positive
    return smallest_positive

print(solution( [1, 2, 3]))
