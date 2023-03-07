#!/usr/bin/env python3

def header(func):
    def inner(*args, **kwargs):
        print("<h1>")
        func(*args, **kwargs)
        print("</h1>")
    return inner

def table(func):
    def inner(*args, **kwargs):
        print("<table>")
        func(*args, **kwargs)
        print("</table>")
    return inner

def link(func):
    def inner(*args, **kwargs):
        print("<a>")
        func(*args, **kwargs)
        print("</a>")
    return inner

@table
@header # val = header(table(say))
@link
def say(name, surname, age):
    print("Hello", name, surname, age)

say('Vasya', 'Ivanov', 25)
