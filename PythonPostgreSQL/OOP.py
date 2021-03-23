class Student:
	def __init__(self,name):# can do the same just add grades and then the grades at the bottom.
		self.name = name
		self.grades = (90,90,93,78,90)

	def average(self):
		return sum(self.grades)/ len(self.grades)


student = Student('Boby')
print(student.name)
print(student.grades)
print(Student.average(student))
print(student.average())# better way to say it.


class Person:
	"""docstring for Person"""
	def __init__(self, name,age):
		self.name = name
		self.age = age

	def __str__(self):#when ypu wannt to turn object into string
		return f"Person {self.name},{self.age} years old."

	def __repr__(self):
		return f'<Person({self.name},{self.age})>'


bob = Person('Bob', 35)
print(bob)
