import random
import time

COUNT = 10

def get_random_list(N):
	arr = []
	for i in range(N):
		rand = random.randint(-10, 10)
		arr.append(rand)
	return arr

def selection_sort(arr):
	'''
	the first argument look for smallest than it and do swap
	O(N^2)
	'''
	for i in range(len(arr)):
		for j in range(i+1, len(arr)):
			if arr[i] > arr[j]:
				arr[i],arr[j] = arr[j],arr[i]
	return arr

def insertion_sort(arr):
	'''
	the next element of array must compare to the previous one
	O(N^2)
	'''
	for i in range(1, len(arr)):
		for j in range(i, 0, -1):
			if arr[j] < arr[j-1]:
				arr[j], arr[j-1] = arr[j-1], arr[j]
			else:
				break
	return arr

def bubble_sort(arr):
	'''
	look for consecutive element and swap
	O(N^2)
	'''
	for i in range(len(arr) - 1):
		for j in range(len(arr) - i - 1): # N-i-1 because the final argument is already sorted
			if arr[j] > arr[j+1]:
				arr[j], arr[j+1] = arr[j+1], arr[j]
	return arr

def sort_and_merge_arrays(arr1, arr2):
	'''
	NOTE: 2 arrays must be sorted at first
	'''
	i = 0
	j = 0
	sorted_arr = []
	while i < len(arr1) and j < len(arr2):
		if arr1[i] <= arr2[j]:
			sorted_arr.append(arr1[i])
			i += 1
		else:
			sorted_arr.append(arr2[j])
			j += 1
	sorted_arr += arr1[i:] + arr2[j:]
	return sorted_arr

def merge_sort(arr):
	'''
	merge sort working as divide array 2 parts
	O(N1^2 + N2^2 + N)
	N1 = N // 2
	N2 = N - N1
	N * log2(N): Ex 8 * log2(8) = 24
	'''
	N = len(arr) // 2
	arr1 = arr[:N]
	arr2 = arr[N:]
	if len(arr1) > 1:
		arr1 = merge_sort(arr1)
	if len(arr2) > 1:
		arr2 = merge_sort(arr2)
	result = sort_and_merge_arrays(arr1, arr2)
	return result

def quick_sort(arr):
	if len(arr) <= 1:
		return arr
	elem = arr[0]
	left = list(filter(lambda i: i < elem, arr))
	center = [ i for i in arr if i == elem ]
	right = list(filter(lambda i: i > elem, arr))
	return quick_sort(left) + center + quick_sort(right)

def run_selection_sort():
	current_arr = get_random_list(COUNT)
	start = time.time()
	# print(f"Before selection sort: {current_arr}\n" \
	# 	f"After selection sort: {selection_sort(current_arr)}")
	selection_sort(current_arr)
	end = time.time()
	print('selection_sort=', end - start, '\n')

def run_insertion_sort():
	current_arr = get_random_list(COUNT)
	start = time.time()
	# print(f"Before insertion sort sort: {current_arr}\n" \
		# f"After insertion sort: {insertion_sort(current_arr)}")
	insertion_sort(current_arr)
	end = time.time()
	print('insertion_sort=', end - start, '\n')

def run_bubble_sort():
	current_arr = get_random_list(COUNT)
	start = time.time()
	# print(f"Before bubble sort sort: {current_arr}\n" \
		# f"After bubble sort: {bubble_sort(current_arr)}")
	bubble_sort(current_arr)
	end = time.time()
	print('bubble_sort=', end - start, '\n')

def run_merge_sort():
	current_arr = get_random_list(COUNT)
	start = time.time()
	# print(f"Before merge sort: {current_arr}\n" \
	# 	f"After merge sort: {merge_sort(current_arr)}")
	merge_sort(current_arr)
	end = time.time()
	print('merge_sort=', end - start, '\n')

def run_quick_sort():
	current_arr = get_random_list(COUNT)
	start = time.time()
	print(f"Before quick sort: {current_arr}\n" \
		f"After quick sort: {quick_sort(current_arr)}")
	# merge_sort(current_arr)
	end = time.time()
	print('quick_sort=', end - start, '\n')

def main():
	# run_selection_sort()
	# run_insertion_sort()
	# run_bubble_sort()
	# run_merge_sort()
	run_quick_sort()
	

if __name__ == '__main__':
	main()