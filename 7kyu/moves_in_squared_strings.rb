# This kata is the first of a sequence of four about "Squared Strings".

# You are given a string of n lines, each substring being n characters long: For example:

# s = "abcd\nefgh\nijkl\nmnop"

# We will study some transformations of this square of strings.

# Vertical mirror: vert_mirror (or vertMirror or vert-mirror)
# vert_mirror(s) => "dcba\nhgfe\nlkji\nponm"
# Horizontal mirror: hor_mirror (or horMirror or hor-mirror)
# hor_mirror(s) => "mnop\nijkl\nefgh\nabcd"
# or printed:

# vertical mirror   |horizontal mirror   
# abcd --> dcba     |abcd --> mnop 
# efgh     hgfe     |efgh     ijkl 
# ijkl     lkji     |ijkl     efgh 
# mnop     ponm     |mnop     abcd
# #Task:

# Write these two functions
# and

# high-order function oper(fct, s) where

# fct is the function of one variable f to apply to the string s (fct will be one of vertMirror, horMirror)
# #Examples:

# s = "abcd\nefgh\nijkl\nmnop"
# oper(vert_mirror, s) => "dcba\nhgfe\nlkji\nponm"
# oper(hor_mirror, s) => "mnop\nijkl\nefgh\nabcd"
# Note:

# The form of the parameter fct in oper changes according to the language. You can see each form according to the language in "Sample Tests".

# Bash Note:

# The input strings are separated by , instead of \n. The ouput strings should be separated by \r instead of \n. See "Sample Tests".

# Forthcoming katas will study other tranformations.

def vert_mirror(strng)
    # Your code
end
def hor_mirror(strng)
    # Your code
end
def oper(fct, s) 
    # Your code
end

def testing(actual, expected)
    Test.assert_equals(actual, expected)
end

Test.describe("opstrings") do
  Test.it("Basic tests vert_mirror") do
    testing(oper(method(:vert_mirror), "hSgdHQ\nHnDMao\nClNNxX\niRvxxH\nbqTVvA\nwvSyRu"), "QHdgSh\noaMDnH\nXxNNlC\nHxxvRi\nAvVTqb\nuRySvw")
    testing(oper(method(:vert_mirror), "IzOTWE\nkkbeCM\nWuzZxM\nvDddJw\njiJyHF\nPVHfSx"), "EWTOzI\nMCebkk\nMxZzuW\nwJddDv\nFHyJij\nxSfHVP")
  end
  Test.it("Basic tests hor_mirror") do
    testing(oper(method(:hor_mirror), "lVHt\nJVhv\nCSbg\nyeCt"), "yeCt\nCSbg\nJVhv\nlVHt")
    testing(oper(method(:hor_mirror), "njMK\ndbrZ\nLPKo\ncEYz"), "cEYz\nLPKo\ndbrZ\nnjMK")
  end
end