

lists = ['Bob','rolf','Anne']

Tuples = ('Bob','rolf','Anne') #cannot add or remove 

sets = {'Bob','rolf','Anne'}# connot have duplicate

print(lists[0])

lists[0] = "Smith"

print(lists)
lists.append("Bob") #add a variable.
print(lists)

lists.remove('Bob')

sets.add('Smith')
print(sets)

# advanced sets and tuples:
# Getting the diffrence
sets1 = {'Bob','rolf','Anne'}
sets2 = {'Bob','rolf','Anne','Smith'}
# order does matter
diffrences = sets2.difference(sets1)
print(diffrences)

# Colliding sets
local = sets2.union(sets1)
print(sets2)
# getting the values from two sets that are the same

# both = art.intersection(science)