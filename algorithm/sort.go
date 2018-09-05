package algorithm

// QuickSort sort array with time O(logn) and space O(n)
func QuickSort(array []int) {
	quickSort(array, 0, len(array)-1)
}

func quickSort(array []int, lo, hi int) {
	i, j := lo, hi
	if hi <= lo {
		return
	}

	flag := array[lo]
	for {
		for ; array[i] <= flag; i++ {
			if i == hi {
				break
			}
		}
		for ; array[j] > flag; j-- {
			if j == lo {
				break
			}
		}
		if i >= j {
			break
		}
		array[i], array[j] = array[j], array[i]
	}
	array[lo], array[j] = array[j], array[lo]
	quickSort(array, lo, j-1)
	quickSort(array, j+1, hi)
}
