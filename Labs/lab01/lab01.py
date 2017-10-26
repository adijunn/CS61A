"""Lab 1: Expressions and Control Structures"""

# Coding Practice


def repeated(f, n, x):
    """Returns the result of composing f n times on x.

    >>> def square(x):
    ...     return x * x
    ...
    >>> repeated(square, 2, 3)  # square(square(3)), or 3 ** 4
    81
    >>> repeated(square, 1, 4)  # square(4)
    16
    >>> repeated(square, 6, 2)  # big number
    18446744073709551616
    >>> def opposite(b):
    ...     return not b
    ...
    >>> repeated(opposite, 4, True)
    True
    >>> repeated(opposite, 5, True)
    False
    >>> repeated(opposite, 631, 1)
    False
    >>> repeated(opposite, 3, 0)
    True
    """
    "*** YOUR CODE HERE ***"
    if n == 0:
        return x

    return repeated(f, n-1, f(x))

def sum_digits(n):
    """Sum all the digits of n.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    """
    "*** YOUR CODE HERE ***"
    if len((str)(n)) == 1:
        return n

    return (n // 10**(len((str)(n))-1) + sum_digits(n % 10**(len((str)(n))-1)))

def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    "*** YOUR CODE HERE ***"
    # if len((str)(n)) == 1:
    #     return False
    # if (str)(n)[:2] == '88':
    #     return True
    # else:
    #     n = (str)(n)
    #     new_n = int(n[1:])
    #     return double_eights(new_n)
    if len(str(n)) == 1:
        return False
    order = 10**(len(str(n))-1)
    order_1 = 10**(len(str(n))-2)
    if (n // order) == 8 and ((n % order) // order_1) == 8:
        return True
    if len(str(n)) == 2:
        return False

    return double_eights(n % order)
