def rabin_karp(s: str, pattern: str) -> int:
    n = len(s)
    m = len(pattern)
    pattern_hash = hash(pattern)
    for i in range(n - m):
        substring = s[i : i + m]
        substring_hash = hash(substring)
        if pattern_hash == substring_hash:
            if pattern == substring:
                return i
    return -1


def polynomial_hash(s: str, x: int, q: int) -> int:
    hash = 0
    for a in s:
        hash = (hash * x) % q
        hash = (hash + a) % q
    return hash


def naive_search(s: str, pattern: str) -> int:
    n = len(s)
    m = len(pattern)
    for i in range(n):
        flag = True
        for j in range(i, i + m):
            if s[j] != p[j]:
                flag = False
                break
        if flag:
            return i
    return -1
