import pandas as pd
from pandas import Series, DataFrame

pd.set_option('display.width', 120)

def abcrange(n, prefix = ''):
    str = 'abcdefghij'
    r = []
    if n == 0:
        return []
    for i in range(n):
        r1 = ''
        if i == 0:
            r1 = str[i]
        else:
            while i > 0:
                r1 = r1 + str[i%10]
                i /= 10
        r.append(prefix + r1)

    return r

def abcdict(n, prefix='', rand=0):
    d = {}
    count = 0
    for k in abcrange(n, prefix):
        if rand:
            import random
            d[k] = random.randint(0,1000)
        else:
            d[k] = count
            count += 1
    return d

if __name__ == '__main__':
    print("load startup ...")

