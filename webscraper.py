import requests
from bs4 import BeautifulSoup

""" currently only outputs the dates with formatting, can be updated with sendmail script to send sms upon site changes. """

data = requests.get('https://www.imdb.com/title/tt13706018/episodes')

soup = BeautifulSoup(data.text, 'html.parser')

#grabs specific div with class to retrieve only the dates for epsode

release_date = soup.find_all('div', class_="airdate")

print(release_date)
