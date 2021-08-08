import os, json, requests

joke_url = 'https://v2.jokeapi.dev/joke/Programming?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single'
slack_url = os.getenv('SLACK_URL')


def get_joke(_joke_url):
    try:
        req = requests.get(_joke_url)
        json_str = json.loads(req.text)
        return json_str['joke']
    except requests.exceptions.RequestException as e:
        raise SystemExit(e)

def post_slack_message(_slack_url, _message):
    headers = {'Content-type': 'application/json'}
    try:
        data = {'text': _message}
        req = requests.post(_slack_url, data=json.dumps(data), headers=headers)
        if req.text == 'ok':
            print("Slack Message send successfully...")
    except  requests.exceptions.HTTPError as e:
        print('Error:', e)
    except  requests.exceptions.ConnectionError as e:
        print('Error:', e)
    except requests.exceptions.Timeout as e:
        print('Error:', e)
    except requests.exceptions.RequestException as e:
        raise SystemExit('Error', e)
      

if __name__ == '__main__':
    if slack_url == "":
        print("'SLACK_URL' is not SET" )
        quit()
    post_slack_message(slack_url, get_joke(joke_url))




