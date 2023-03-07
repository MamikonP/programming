#!/usr/bin/env python3

from dataclasses import dataclass, field
from datetime import date

@dataclass
class Person:
    name: str
    surname: str
    birthdate: date
    age: int = 0

    def get_age(self):
        delta = date.today() - self.birthdate
        return int(delta.days / 365)

    def print_person_data(self):
        self.age = self.get_age()
        print(self.name)
        print(self.surname)
        print(self.birthdate)
        print(self.age)

def main():
    person = Person("Test name", "Test surname", date(1998, 6, 12))
    person.print_person_data()

if '__main__' == __name__:
    main()
