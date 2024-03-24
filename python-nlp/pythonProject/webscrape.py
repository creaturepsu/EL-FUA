import bs4
import requests
import os

archive_url = "https://madisonsciarrillo.github.io/AliceUndergroundProject/index.html"
def get_linkContents():
    r = requests.get(archive_url)
    print(f"{r=}")
    soup = bs4.BeautifulSoup(r.content, 'html.parser')

    # find all link text inside <a> elements and send it to the
    # download_toFile function to be output to a new file
    linkText = []
    for item in soup.findAll('a'):
        print(f"{item.text}")
        linkText.append(item.text)
    print(linkText)
    download_toFile(linkText)
    return
#Ive done this to our own alice undeground website but only geta list of the nav bar.
# is it possible to change the <a> into <section> to print out the text inside one of the texts?
#or is the comment above this one refering to a rigid set of items that beautiful soup can search through?
def download_toFile(linkText):
    # We are just planning to output one file only here.
    file_name = "outputLinkText.txt"
    print("Downloading file: " + file_name)
    working_dir = os.getcwd()
    file_deposit = os.path.join(working_dir, file_name)
    print(file_deposit)
    # write to the file:
    with open(file_deposit, 'w') as f:
        for item in linkText:
            f.write(item + '\n')
            print("Downloaded " + item)

    return

if __name__ == "__main__":

    get_links = get_linkContents()