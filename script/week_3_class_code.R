#week_3_class_code
#Excel is difficult to retrace your steps, different to know what exactly happened
#think like a computer not like a human
#never modifty raw data

read.csv("data/tidy.csv")

x <- 4
x<-4



# Vectors

weight_g <- c(50, 60, 31, 89)


weight_g


# now characters
animals <- c("mouse", "rat", "dog", "cat")
animals

# vector exploration tools
length(weight_g)


length(animals)

class(weight_g)
class(animals)


# str is my go-to first tool for looking at an object
str(x)

str(weight_g)

# Be careful about adding values and running this line multiple times
weight_g <- c(weight_g, 105)
weight_g


weight_g <- c(25, weight_g)
weight_g


# 6 types of atomic vectors: "numeric" ("double"), "character", "logical", "integer (whole round numbers (-1,0,1,2,3,4,5", "complex", "raw"


# first 4 we listed are the main ones that we will work with

typeof(weight_g) #delves furhter into asking what is something


weight_integer <- c(20L, 21L, 85L)
class(weight_integer)
typeof(weight_integer)


num_char <- c(1, 2, 3, "a")
class(num_char)
#made them all characters, when you add a single character, it turns all numbers into characters

num_logical <- c(1, 2, 3, TRUE)
class(num_logical)
#turned everything into numbers, 

char_logical <- c("a", "b", "c", TRUE)
class(char_logical)
#we got characters, changed the TRUE into "True"

tricky <- c(1, 2, 3, "4")
class(tricky)
#character

combined_logical <- c(num_logical, char_logical)
class(combined_logical)
#anything can become a character, then numbers (less specific), floating point, integers (numbers without decimasls, finally true/false (can be turned into 0's and 1's (pickiest)))


# subsetting vectors
animals

animals[3]


animals[c(2,3)]
animals[c(3,1,3)]


# conditional subsetting
weight_g
weight_g[c(T, F, T, T, F, T, T)]


weight_g > 50

weight_g(weight_g > 50)
weight_g(weight_g > 50)


# you can combine multiple tests you and the and or symbols
# multiple conditions

weight_g(weight_g<30 | weight_g>50)


weight_g
weight_g[weight_g>= 30 & weight_g ==89]

#number (0) means there's no value within that bracket that meets your designation

#searching for characters
animals
animals [animals == "cat"| animals== "rat"]

animals [animals %in% c("rat", "antelope", "jackalope", "hillogriff")]

"four" > "five"
"six" > "five"
"eight"> "five"

"z"> "y"

# it's alphabetic order!!! That's what R is looking at in the above example


# missing values
heights <- c(2, 4, 4, NA, 6)
str(heights)

mean(weight_g)

mean(heights)
max(heights)

mean(x = heights, na.rm = TRUE)
max(heights,na.rm = TRUE)

is.na (heights)
na.omit (heights)
complete.cases(heights)
