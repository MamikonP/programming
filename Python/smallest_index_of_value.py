import time

index = 0

def get_smallest_index(arr):
    for i in range(len(arr)):
        if arr[i] > 0:
            return i
    return -1

def get_smallest_index_optimized(arr):
    if arr[0] > 0:
        return 0
    index = len(arr) // 2
    while len(arr) > 1:
        length = len(arr) // 2
        if arr[length - 1] > 0:
            arr = arr[:length]
            index -= len(arr) // 2 if len(arr) > 1 else 1
        else:
            arr = arr[length:]
            index += len(arr) // 2 if len(arr) > 1  else 0
    if arr[0] > 0:
        return index
    return -1

def get_smallest_index_recursion(arr, is_small_zero: bool=True):
    length = len(arr) // 2
    global index
    if index == 0:
        index = length
    elif is_small_zero:
        index += len(arr) // 2 if len(arr) > 1 else 0
    else:
        index -= len(arr) // 2 if len(arr) > 1 else 1
    if len(arr) <= 1:
        return index if arr[0] > 0 else -1
    elif arr[length - 1] > 0:
        return get_smallest_index_recursion(arr[:length], is_small_zero=False)
    elif arr[length - 1] <= 0:
        return get_smallest_index_recursion(arr[length:], is_small_zero=True)
    return -1

def run_linear(arr):
    start = time.time()
    print(get_smallest_index(arr))
    end = time.time()
    print("smallest simple = ", end - start, '\n')

def run_optimized(arr):
    start = time.time()
    print(get_smallest_index_optimized(arr))
    end = time.time()
    print("smallest optimized = ", end - start, '\n')

def run_recusrion(arr):
    start = time.time()
    print(get_smallest_index_recursion(arr))
    end = time.time()
    print("smallest recursion = ", end - start)


def get_list():
    # this function is used only for count time run_* functions.
    return list(range(-55555555, 0)) + [4]

def main():
    #arr = get_list()
    arr = [-1,-2,-3,-4,-5,-8,9,10,11,12,13,14]
    run_linear(arr)
    run_optimized(arr)
    run_recusrion(arr)

if __name__ == "__main__":
    main()
