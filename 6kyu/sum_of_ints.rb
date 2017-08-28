# Write this function

# f(n, m) = E(n)(i = 1) i % m

# for i from 1 to n, do i % m and return the sum

# f(n=10, m=5) // returns 20 (1+2+3+4+0 + 1+2+3+4+0)
# You'll need to get a little clever with performance, since n can be a very large number


def f(n,m)
  #your code here
end

Test.assert_equals(f(10, 5), 20)
Test.assert_equals(f(20, 20), 190)
Test.assert_equals(f(15, 10), 60)