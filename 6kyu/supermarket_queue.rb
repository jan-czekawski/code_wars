# There is a queue for the self-checkout tills at the supermarket. 
# Your task is write a function to calculate the total time required
# for all the customers to check out!

# The function has two input variables:

# customers: an array (list in python) of positive integers 
# representing the queue. Each integer represents a customer, 
# and its value is the amount of time they require to check out.
# n: a positive integer, the number of checkout tills.
# The function should return an integer, the total time required.

# EDIT: A lot of people have been confused in the comments. 
# To try to prevent any more confusion:

# There is only ONE queue, and
# The order of the queue NEVER changes, and
# Assume that the front person in the queue (i.e. the first element
# in the array/list) proceeds to a till as soon as it becomes free.
# The diagram on the wiki page I linked to at the bottom of the 
# description may be useful.
# So, for example:

# queue_time([5,3,4], 1)
# # should return 12
# # because when n=1, the total time is just the sum of the times

# queue_time([10,2,3,3], 2)
# # should return 10
# # because here n=2 and the 2nd, 3rd, and 4th people in the 
# # queue finish before the 1st person has finished.

# queue_time([2,3,10], 2)
# # should return 12
# N.B. You should assume that all the test input will be valid,
# as specified above.

# P.S. The situation in this kata can be likened to the 
# more-computer-science-related idea of a thread pool, with relation 
# to running multiple processes at the same 
# time: https://en.wikipedia.org/wiki/Thread_pool


# MY SOLUTIONS
def queue_time(customers, n)
  return customers.inject(0, &:+) if n == 1
  time = 0
  cust_num = customers.size
  tills = Array.new(n > cust_num ? cust_num : n) 
  tills = tills.map do |till|
            customers.shift
          end
  until tills.all?(&:zero?) && customers.empty?
    tills.map! do |till|
      if till == 0
        unless customers.empty?
          till = customers.shift
          till -= 1
        end      
      else
        till -= 1
      end
      
      till
    end
    time += 1
  end
  
  time
end

def first_customers(tls:, cust:)
  cust_num = cust.size
  tills = Array.new(tls > cust_num ? cust_num : tls)
  tills.map { cust.shift }
end

def only_one_till(cust:, tls:)
  return cust.inject(0, &:+) if tls == 1
end

def time_occurs(tls:, cust:, tm:)
  until tls.all?(&:zero?) && cust.empty?
    tls.map! do |till|
      if till == 0
        unless cust.empty?
          till = cust.shift
          till -= 1
        end      
      else
        till -= 1
      end
      till
    end
    tm += 1
  end
  tm
end

def queue_time(customers, n)
  only_one_till(cust: customers, tls: n)
  time = 0
  tills = first_customers(tls: n, cust: customers)
  time_occurs(tls: tills, cust: customers, tm: time)
end

# BEST SOLUTIONS
def queue_time(customers, n)
  arr = Array.new(n, 0)
  customers.each { |customer| arr[arr.index(arr.min)] += customer }
  arr.max
end

def queue_time(customers, n)
  checkouts = []; time = 0
  n.times { checkouts << customers.shift unless customers[0] == nil }
  until checkouts.all? { |c| c == 0 }
    time += 1
    checkouts.map! { |c| c == 0 ? c : c - 1 }
    checkouts.map! { |c| c == 0 && customers[0] != nil ? customers.shift : c }
  end
  time
end

p queue_time([], 1)# 0, "wrong answer for case with an empty queue")
p queue_time([5], 1)# 5, "wrong answer for a single person in the queue")
p queue_time([2], 5)# 2, "wrong answer for a single person in the queue")
p queue_time([1,2,3,4,5], 1)# 15, "wrong answer for a single till")
p queue_time([1,2,3,4,5], 100)# 5, "wrong answer for a case with a large number of tills")
p queue_time([2,2,3,3,4,4], 2)# 9, "wrong answer for a case with two tills")
