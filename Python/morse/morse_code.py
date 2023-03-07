#!/usr/bin/env python3

from pathlib import Path
import os

def get_data_from_file(filename):
    dict_data = {}
    with open (filename, 'r') as f:
        data = f.readlines()
        f.close()
        for d in data:
            value = d.split('\t')
            if not value[0] in dict_data:
                dict_data[value[0]] = value[1].replace('\n', '')
    return dict_data


def get_morse_code():
    abs_path = Path(__file__).resolve()
    filename = os.path.join(Path(abs_path).parent, Path(abs_path).stem + ".txt")
    return get_data_from_file(filename)

def print_morse_code_equivalent_to_string(morse_code, string):
    morse = ''
    for s in string:
        morse += ' ' if s == ' ' else morse_code[s.upper()]
    print('\n', morse)

def main():
    morse_code = get_morse_code()
    string = input("String to convert Morse code: ")
    print_morse_code_equivalent_to_string(morse_code, string)

if __name__ == "__main__":
    main()
