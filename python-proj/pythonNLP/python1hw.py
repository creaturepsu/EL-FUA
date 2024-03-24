import spacy
nlp = spacy.load('en_core_web_sm')

spunchbop = open('spoinglebop.txt', 'r', encoding='utf8') #what exactly is this thing that encoding equals supposed to be?
words = spunchbop.read()
wordstrings = str(words)
print(wordstrings)

oceanlyrics = nlp(wordstrings) #is the wordstrings in the parenthesis linked to a bank of features that nlp does?
for token in oceanlyrics:
    # if token.pos_ == "VERB":
    print(token.text, "---->", token.pos_, ":::::", token.lemma_, token.is_alpha, token.is_alpha, token.tag_) #what do the arrows and semicolons do? I assumed they were to accuratly find the function they were associated with but I think I ended up breaking it by adding my own bits

    #ok this works now finally. my bad for stealing some code but I really had a tough time figuring out how this worked


23