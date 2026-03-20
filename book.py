from stats import get_word_count, get_letter_count, sort_list

def get_book_text(filepath):
    with open(filepath) as f:
        file_contents = f.read()
    return file_contents

def create_report(filepath, filename):
    book_text = get_book_text(filepath)
    word_count = get_word_count(book_text)
    letter_count = get_letter_count(book_text)
    sorted_letters = sort_list(letter_count)
    print("")
    print(f"============ BOOKBOT ============")
    print(f"Analyzing book found: {filename}...")
    print(f"----------- Word Count ----------")
    print(f"Found {word_count} total words")
    print(f"--------- Character Count -------")
    for dictionary in sorted_letters:
        print(f"{dictionary["char"]}: {dictionary["num"]}") 
    print(f"============= END ===============")
