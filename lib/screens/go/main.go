package main

import (
	"fmt"
)

func simpleInterest(principal float64, rate float64, time float64) float64 {
	interest := (principal * rate * time) / 100
	return interest
}

func main() {

	simpleInterest(2, 4, 5)
	var number int

	var myap map[string]string
	var sfs string
	var hit []int64

	myap = make(map[string]string)

	type Person struct {
		name string
		age  int64
	}

	fmt.Println(myap)
	fmt.Println(sfs)
	fmt.Println(hit)

	myMap := map[string]int{
		"one": 1,
		"two": 2,
	}
	value1 := myMap["one"]
	myMap["one"] = value1
	number = 10
	number = 30
	var arrays []int
	myArg := [5]int{1, 2, 3, 4, 5}
	mySlice := myArg[:]

	mySlice = append(mySlice, 1, 3, 4)

	myArray := []int{}
	myArray = append(arrays, 4, 5)
	myArray[0] = 34
	fmt.Println("Length of array:", len(myArray))
	for i := 0; i < len(myArray); i++ {

		count := 0
		for count < 5 {
			fmt.Println(count)
			count++
		}
		fmt.Println(i)
	}

	for index, value := range myArg {
		fmt.Println(index, value)
		fmt.Printf("index:%d, value:%v\n", index, value)
	}

	numbers := 24
	if numbers > 24 {
		fmt.Println("hello worlds")
	} else if numbers < 34 {
		fmt.Println("free world")
	} else {
		fmt.Println("we on track")
	}

	const pi = 3.245

	var myNns string
	fmt.Println(number)
	fmt.Println(myNns)
	fmt.Println(numbers)
	fmt.Println(pi)
	fmt.Println(myArray[0])
	fmt.Println(arrays)
	fmt.Println(myMap)

	var myName string = "hello world"
	fmt.Println(myName)

	myFame := "hello"

	fmt.Println(myFame)

}
