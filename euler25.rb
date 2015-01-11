# Problems 1 - 25 from the Project Euler website!

# Euler 1: Find the sum of all multiples of 3 & 5 below 1000
# Answer: 233168
# sum = 0
# (1..999).each do |i|
# 	(i%3 == 0 || i%5 == 0) ? sum = sum + i : sum
# end
# puts sum


# Euler 2: Sum the even Fibonacci numbers under 4 million
# Answer: 4,613,732
# x = 1
# y = 2
# z = 0
# sum = z
# until z > 4000000
# 	z = x + y
# 	(z%2 == 0) ? sum = sum + z : sum
# 	x = y
# 	y = z
# end

# puts sum + 2


# Euler 3: What is the largest prime factor of 600851475143?
# Answer: 6857
# require 'prime'
# def factors_of(number)
#   number.prime_division.map(&:first)
# end

# puts factors_of(600851475143).pop


# Euler 4: Find the largest palindrome made from the product of two 3-digit numbers.
# Answer: 906609
# largest = 0
# 999.downto(500).each do |num1|
# 	num1.downto(500).each do |num2|
# 		pal = (num1*num2)
# 		(pal > largest && pal.to_s == pal.to_s.reverse) ? largest = pal : largest
# 	end
# end

# puts "largest palindrome is: #{largest}"


# Euler 5: What is the smallest positive number that is evenly 
#   divisible by all of the numbers from 1 to 20?  This is a logic problem.
# Answer: 232792560
# x = (2*2*2*2*3*3*5*7)*11*13*17*19  #set in parens gives all other #<20, e.g. 14,18
# puts x


# Euler 6: Find the difference between the sum of the squares of the first 100 integers
# & the square of the sum.
# Answer: 25164150
# sum = 0
# squares = 0
# (1..100).each do |i|
# 	sum += i
# 	squares += i**2
# end
# puts sum
# puts squares
# puts "the difference is: #{(sum*sum) - squares}"


# Euler 7:  What is the 10 001st prime number? 
# Answer: 104,743
# require 'prime'
# puts Prime.take(10001).pop
## Method before I learned of ".take":
# array = []
# (1..150000).each do |n|
# 	n.prime? ? array.push(n) : array
# 	array.length > 10000 ? break : next
# end
# puts array.pop


# Euler 8: Find the thirteen adjacent digits in the 1000-digit number that have 
# the greatest product. What is the value of this product?  Answer: 23514624000
# string = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
# products = []
# (0...1000).each do |x|
# y= x + 12
# product = 1
# (x..y).each do |i|
# product = product * string[i].to_i
# end
# products = products.push(product)
# end
# puts products.max


# Euler 9: There exists exactly one Pythagorean triplet for which a**2 + b**2 = c**2 
# and a + b + c = 1000.  Find the values of a,b,c and their product abc.
# Answer: 31875000
# 997.downto(1).each do |a| 
# 	1.upto(a-1).each do |b|
# 		c = 1000-a-b
# 		if a**2 + b**2 == c**2
# 			puts "a = " + a.to_s
# 			puts "b = " + b.to_s
# 			puts "c = " + c.to_s
# 			puts a*b*c
# 		else
# 			next
# 		end
# 	end
# end


# Euler 10: Summation of Primes under 2 million
# Answer: 142913828922
# require 'prime'
# puts Prime.take_while {|p| p<2000000}.inject(:+)
# #Note: a method for giving all primes in a range
# print Prime.take_while {|x| x <= 100 }.drop_while {|x| x < 50 }
# puts


# Euler 11: Largest product in a 20x20 grid
# Answer: ?  The data file is 20grid.txt


# Euler 12: What is the value of the first triangle number to have over five hundred divisors?
# A triangle # is the sum of integers, e.g., the seventh such number is 1+2+3+4+5+6+7 = 28.
# Answer: 76576500
# @divisors = []
# sum = 1
# i = 1
# require 'prime'
# def factors_of(number)
#   primes, powers = number.prime_division.transpose
#   exponents = powers.map{|i| (0..i).to_a}
#   @divisors = exponents.shift.product(*exponents).map do |powers|
#     primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
#   end
#   @divisors
# end

# until @divisors.length > 500
# 		i += 1
# 		sum += i
# 		@divisors = []
# 		factors_of(sum)
# end
# puts sum


#Euler 13: Large sum: add 100 50-digit numbers, give first 10 digits of result
# Answer: 5537376230   The data file is big_sum.txt
# integer_array = []
# lines = File.readlines(ARGV.first)
# array = lines.collect(&:strip)
# integer_array = array.collect { |x| x.to_i }.inject(:+)

# puts integer_array


# Euler 14: Collartz sequences: Which starting number, under one million, produces the longest chain?
# Answer: 837799, chain length: 524
# Below the 'methods' approach (#2) is 25% faster than using the 'Proc' approach (#1 below).
# require 'benchmark'
# Benchmark.bm do |bm|
# 	bm.report("proc:") do
# 	halves = Proc.new do |n|
# 		n/2
# 	end

# 	times = Proc.new do |n|
# 		3*n + 1
# 	end

# 	collartz_array = []
# 	(77000..1000000).each do |n|
# 		x = n
# 		array = []
# 		while n > 1
# 			if n%2 == 0
# 				array.push(halves.call(n))
# 				n = array.last.to_i
# 			else
# 				array.push(times.call(n))
# 				n = array.last.to_i
# 			end
# 		end

# 		if array.length > collartz_array.last.to_i
# 			collartz_array = []
# 			collartz_array = collartz_array.push(x)
# 			collartz_array = collartz_array.push(array.length)
# 		else
# 			collartz_array
# 		end
# 	end
# 	puts "#{collartz_array[0]} produces the longest sequence, length: #{collartz_array[1]}"
# end

# 	bm.report("methods:") do
# 		def halves(n)
# 			n/2
# 		end

# 		def times(n)
# 			3*n + 1
# 		end
# 		collartz_array = []
# 		(77000..1000000).each do |n|
# 			x = n
# 			array = []
# 			while n > 1
# 				if n%2 == 0
# 					array.push(halves(n))
# 					n = array.last.to_i
# 				else
# 					array.push(times(n))
# 					n = array.last.to_i
# 				end
# 			end

# 			if array.length > collartz_array.last.to_i
# 				collartz_array = []
# 				collartz_array = collartz_array.push(x, array.length)
# 			else
# 				collartz_array
# 			end
# 		end
# 		puts "#{collartz_array[0]} produces the longest sequence, length: #{collartz_array[1]}"
# 	end
# end


# Euler 15: Lattice paths: what is the number of paths through a 20x20 lattice?
# Answer: 137846528820

# @fact = 1
# def factorial n
# 	if n >= 2
# 		@fact = @fact*n
# 		factorial(n-1)
# 	else
# 		@fact
# 	end
# end
# x = factorial(40)
# puts x
# @fact = 1
# y = factorial(20)**2
# puts y
# paths = x/y
# puts "The number of paths is #{paths}!"


# Euler 16: Power digit sum --sum the digits of the number: 2**1000
# Answer: 1366
# sum = 0
# b = (2**1000).to_s
# term = b.length-1
# (0..term).each do |i|
#   sum = sum + b[i].to_i
# end

# puts sum


# Euler 17: Number letter count: what is the number of letters used to spell out each number between 1 and 1000 inclusive?
# Answer:
# string = 'onetwothreefourfivesixseveneightnineteneleventwelvethirteenfourteenfifteensixteenseventeeneightteennineteen'.length
# puts string
# string2 = 'onetwothreefourfivesixseveneightnine'.length
# puts string2

# Euler 20: Sum the digits of 100!
# Answer: 648
# @fact = 1
# sum = 0
# def factorial n
# 	if n >= 2
# 		@fact = @fact*n
# 		factorial(n-1)
# 	else
# 		@fact
# 	end
# end

# x = factorial(100)
# string = x.to_s
# (0...(string.length)).each do |i|
# 	sum = sum + string[i].to_i
# end

# puts "The sum of the digits of 100! is #{sum}."


# Euler 25:  What is the first term in the Fibonacci sequence to contain 1000 digits?
# Answer: 4782
# @i = 3
# def fib (a, b)
# 	@i += 1
# 	if b.to_s.length < 1000
# 		c = b 
# 		b = a+b
# 		a = c
# 		fib(a, b)
# 	else
# 		#puts b
# 		puts "The #{@i}nd term in the Fibonacci sequence contains 1000 digits."
# 	end
# end

# fib(2, 3)


