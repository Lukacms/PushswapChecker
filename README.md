# Pushswap Checker

## Project

Second year mini-project "rush" in Epitech's Paradigm Pool.

The goal is to make a verification for a first-year project: `pushswap`, which sort a list of number in ascending order using specific operations (detailed below) and printing them. The verification will take the output of the pushwsap and the original list, and do all the operations to see if the list is sorted.

This program is made in `haskell` and compiled with a `Makefile`.

### Operations

All the operations takes two lists : l_a and l_b.

|   Operation   |   Description   |
|---------------|-----------------|
|   `sa`   |   swap the first two elements of l_a (nothing will happen if there aren’t enough elements).   |
|   `sb`   |   swap the first two elements of l_b (nothing will happen if there aren’t enough elements).   |
|   `sc`   |   sa and sb at the same time.   |
|   `pa`   |   take the first element from l_b and move it to the first position on the l_a list (nothing will happen if l_b is empty).   |
|   `pb`   |   take the first element from l_a and move it to the first position on the l_b list (nothing will happen if l_a is empty).   |
|   `ra`   |   rotate l_a toward the beginning, the first element will become the last.   |
|   `rb`   |   rotate l_b toward the beginning, the first element will become the last.   |
|   `rr`   |   ra and rb at the same time.   |
|   `rra`   |   rotate l_a toward the end, the last element will become the first.   |
|   `rrb`   |   rotate l_b toward the end, the last element will become the first.   |
|   `rrr`   |   rra and rrb at the same time.   |

## How to build project

| Command          | Result                                          |
| ---------------- | ----------------------------------------------- |
| `make`           | Builds a ```pushswap_checker``` executable.          |
| `make clean`     | Cleans build dumps, keeping the executable.     |
| `make fclean`    | Removes all of the files created by the build.  |
| `make re`        | Calls `make fclean` and then `make`.            |

### Execute project (example)

```sh
$> echo "sa pb pb pb sa pa pa pa" | ./pushswap_checker 2 1 3 6 5 8
```

The output will then be: `OK`

### Authors

* [Louis Bassagal](https://github.com/LouisBassagal/)
* [Samuel Florentin](https://github.com/SamuelFlorentin)
* [Luka Camus](https://github.com/Lukacms)
