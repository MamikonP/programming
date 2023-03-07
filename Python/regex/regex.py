import re


def main():
    print(r'\tTab') # raw string
    pattern = re.compile(r'\d\d\d[-.]\d\d\d[-.]\d\d\d')

    with open('data.txt', 'r') as f:
        content = f.read()
        matches = pattern.finditer(content)
        for match in matches:
            print(match)

if __name__ == "__main__":
    main()
