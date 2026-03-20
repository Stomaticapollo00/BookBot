def get_word_count(book_text):
    word_count = 0
    words = book_text.split()
    for word in words:
        word_count += 1
    return word_count

def get_letter_count(book_text):
    book_text_lower = book_text.lower()
    letter_list = list(book_text_lower)
    letter_count = {}
    for letter in letter_list:
        if letter not in letter_count:
            letter_count[letter] = 1
        else:
            letter_count[letter] += 1
    return letter_count

def sort_on(items):
    return items["num"]

def sort_list(letter_dictionary):
    sorted_list = []
    for letter in letter_dictionary:
        if letter.isalpha():
            letter_dict = {
                "char":letter,
                "num":letter_dictionary[letter],
            }
            sorted_list.append(letter_dict)
    sorted_list.sort(reverse=True, key=sort_on)
    return sorted_list
