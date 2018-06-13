import requests

MAX_NO_OF_REPOS=1000

url = "https://api.github.com/users/thoughtworks-jumpstart/repos?per_page={}".format(MAX_NO_OF_REPOS)

response = requests.request("GET", url, data="")
data = response.json()

repos = [repo['full_name'] for repo in data]
for repo in repos:
  print(repo)