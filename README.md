Pusheame
========

[![Still maintained](http://stillmaintained.com/lmivan/pusheame.png)](http://stillmaintained.com/lmivan/pusheame")

Pusheame is a proof-of-concept of the [platform-core](http://grails.org/plugin/platform-core) and [events-push](http://grails.org/plugin/events-push) Grails plugins.
The application has been developed during the 3rd [Kaleidos](http://kaleidos.net) [PiWeek](http://piweek.es).

The goal of the application is get geolocalized pictures from Instagram Real-Time API and display them in a map also in real-time. In addition, you can enjoy a wall full of the received pictures.


Usage
-----

After you install it, run the `grails-run app` and open the following urls in your browser:

```
http://localhost:8080/pusheame/map
http://localhost:8080/pusheame/wall
```

There is a test url that gets a random picture from a fixed list and pushes it to the browser.

```
$ wget http://localhost:8080/pusheame/test -O -
```


Instagram Real-Time API
-----------------------

If you want to use the application with the Instagram Real-Time API you have to subscribe to geographical notifications. Due to the way Real-Time Instagram API works you have to expose you localhost:8080 port to be accesible from the internet. The easy way to do it is using [localtunnel](https://github.com/progrium/localtunnel).

Once you have created the tunnel, you can subscribe to its notifications. I have created a [script](https://github.com/lmivan/pusheame/blob/master/create-instagram-notifications.sh) to subscribe to the following USA cities:
Atlanta, Austin, Berkeley, Boston, Brooklyn, Chicago, Denver, Detroit, Houston, Las Vegas, Los Angeles, Madison, Miami, Minneapolis, New Orleans, New York City, Oakland, Palo Alto, Philadelphia, Phoenix, Pittsburg, Portland, Salt Lake City, San Antonio, San Diego, San Francisco, San Jose, Seattle, Washington DC.

At the beginning of the script you have to use your own credentials:

``` bash
CLIENT_ID=YOUR-INSTAGRAM-CLIENT-ID
CLIENT_SECRET=YOUR-INSTAGRAM-CLIENT-SECRET
CALLBACK_URL=http://XXXXX.localtunnel.com/pusheame/
```

Once you change the values you can execute the script. For each notification you get an OK response like this:

``` json
{
    "meta": {
        "code": 200
    },
    "data": {
        "object": "geography",
        "object_id": "1739230",
        "aspect": "media",
        "callback_url": "http://pusheame.cloudfoundry.com/instagram-real-time",
        "type": "subscription",
        "id": "2733689"
    }
}
```
To remove all the subscriptions you can run the following command:
``` bash
curl -X DELETE "https://api.instagram.com/v1/subscriptions?client_secret=YOUR-CLIENT-SECRET&client_id=YOUR-CLIENT-ID&object=all"
```

Now look at the browser and have fun with the pictures :-)
