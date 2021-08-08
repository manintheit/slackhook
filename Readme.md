## Sending Slack Message 

This repo contains sample ```Python``` Code, ```Dockerfile``` and ```K8S``` deployment in order to send ```Slack``` message using Incoming Webhook app. You can find more info on how to enable ```Incoming Webhook``` in the [url](https://api.slack.com/messaging/webhooks). The Python code in this repo sends a joke to ```Slack Channel``` every 5 minutes.




## K8S Deployment
Whether or not you are using Proxy, you MUST set ```slack_url``` properly in the ```slack.yml```.

```yaml
slack_url: https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX
```


### (Without Proxy)
```bash
kubectl apply -f ks8/slack.yml
```

### (With Proxy)

If your infrastructre accessing the Internet over proxy, you should enable proxy related settings by uncommenting the following lines both on ```ConfigMap``` and ```CronJob``` definition.


```yaml
# proxy: proxy.squid.local:3128
```

```yaml
              # - name: PROXY
              #   valueFrom:
              #     configMapKeyRef:
              #       name: slack-cfgm
              #       key: proxy      
```

```bash
kubectl apply -f ks8/slack.yml
```


## Experiment

### Checking Cronjob

```bash
kubectl get cronjob
NAME         SCHEDULE      SUSPEND   ACTIVE   LAST SCHEDULE   AGE
slack-hook   */5 * * * *   False     0        31s             5m3s
```

### Checking pods 

```bash
kubectl get pods 
NAME                        READY   STATUS      RESTARTS   AGE
slack-hook-27140575-85wm5   0/1     Completed   0          12m
```

### Checking Execution Logs

```bash
kubectl logs slack-hook-27140575-85wm5 
PROXY is not set
Slack Message send successfully...
```


It works. By the way, I must accept that jokes being sent do not make sense to me.

![Slack](img/slackwebhook_exp1.png)

