import spacy
import os

nlp = spacy.load('en_core_web_md')


def read_text_files(filepath):
    with open(filepath, 'r', encoding='utf8') as f:
        read_file = f.read()
        string_file = str(read_file)
        tokens = nlp(string_file)

        word_of_interest = nlp('the')

        high_similarity_dict = {}
        for token in tokens:
            if token and token.vector_norm:
                if word_of_interest.similarity(token) > .3:
                    high_similarity_dict[token] = word_of_interest.similarity(token)

        high_similarity_reduced = {}
        for key, value in high_similarity_dict.items():
            if value not in high_similarity_reduced.values():
                high_similarity_reduced[key] = value

        return high_similarity_reduced


working_dir = os.getcwd()
inside_dir = os.listdir(working_dir)
coll_path = os.path.join(working_dir, 'textCollection')

for file in os.listdir(coll_path):
    if file.endswith(".txt"):
        filepath = f"{coll_path}/{file}"
        print(filepath)
        values = read_text_files(filepath)
        sorted_values = sorted(values.items(), key=lambda x: x[1], reverse=True)
        converted_dict = dict(sorted_values)
        print(converted_dict)
