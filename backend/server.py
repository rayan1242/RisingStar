import requests

url = "https://api-v2.short.io/statistics/link/1302637"

querystring = {"period":"today","tzOffset":"0"}

headers = {
    'accept': "*/*",
    'authorization': "pk_SRz6kZ9DVdzXyLGY"
    }

response = requests.request("GET", url, headers=headers, params=querystring)

print(response.text)