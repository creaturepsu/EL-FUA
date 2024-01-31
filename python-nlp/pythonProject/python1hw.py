import spacy
spacy.prefer_gpu()

nlp = spacy.load('en_core_web_sm')

if __name__ == '__main__':
    with open("char-chatgptex2_charlie-branch.txt", "r") as f:
        contents = f.read()

        nlp()

#why isnt any of this being processed? it used to show the entire text in the box below