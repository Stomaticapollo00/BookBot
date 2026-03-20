import sys, os

from book import create_report

def return_to_shell():
    return_code = os.system('/home/njord/workspace/bootdev/python_bookbot/bookbot.sh')

def get_sys(sys_list):
    if len(sys_list) < 2:
        print("Usage: python3 main.py <book_name>")
        print("Please remember to enter a book name!")
        return_to_shell()
    else:
        filename = sys_list[1]
        filepath = "/home/njord/workspace/bootdev/python_bookbot/books/" + sys_list[1].lower() + ".txt"
        if os.path.isfile(filepath):
            create_report(filepath, filename)
            return_to_shell()
        else:
            print(f"===========  The book '{sys_list[1]}' was not found  ===========")
            print("Consider adding this title to our 'books' library :)")
            return_to_shell()

def main():
    get_sys(sys.argv)

main()