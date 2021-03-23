class ClassTest:
	def instance_method(self):
		prit(f'Callde instance_method {self}')


		@classmethod
		def class_method(cls):
			print(f'Called class_method pf {cls}')


		@staticmethod
		def static_method():
			print('Called static_method')


#  ClassTest.classmethod()
# ClassTest.staticmethod()

test = ClassTest()
# test.instance_method()
# ClassTest.instance_method()

class Book:
	TYPES = ('hardcover','paperback')

	def __init__(self,name,book_type , weight):
		self.name = name
		self.book_type = book_type
		self.weight = weight

	def __repr__(self):
		return f'<book {self.name},{self.book_type}, weighing {self.weight}g>'

	@classmethod
	def hardcover(cls, name,page_weight):
		return cls(name, cls.TYPES[0], page_weight + 100)

	@classmethod
	def paperback(cls, name,page_weight):
		return cls(name, cls.TYPES[1], page_weight)

book = Book.hardcover('Harry Potter' , 1500)
light = Book.paperback('Python 101',600)
			

print(book.name)
