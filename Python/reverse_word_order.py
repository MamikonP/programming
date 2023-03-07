#!/usr/bin/env python3

def input_sentence():
    sentence = input("Enter multiple word string: ")
    if ' ' not in sentence:
        return None
    return sentence

def reverse_sentence(sentence):
    value = None
    if not sentence is None:
        value = sentence.split()[::-1]
    return value

def main():
    sentence = input_sentence()
    if sentence is None:
        print("Invalid sentence.")
    reversed_sentence = reverse_sentence(sentence)
    print(reversed_sentence)


if '__main__' == __name__:
    main()
