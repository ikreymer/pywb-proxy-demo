pywb-proxy-demo
===============

This project provides a demo for using the [pywb](https://github.com/ikreymer/pywb) web replay tools as an HTTP/S proxy mode.

It demonstrates the following new features in upcoming release of pywb:

* HTTPS proxy mode support (with trusted certificate)
* Capture time switiching proxy mode.
* Archive collection switching in proxy mode.
* POST request replay [(more-info)](https://github.com/ikreymer/pywb/wiki/POST-request-replay)
* Optional banner or unaltered replay (banner enabled in the demo).
* HTTPS -> HTTP rewriting when accessing via http
* Compatible with standard WSGI container running on a single port (uWSGI preferred)


Usage
-----

1. Clone and install with `pip install -r requirements.txt`

2. To enable HTTPS support, the included certificate, [pywb_ca.pem](https://github.com/ikreymer/pywb-proxy-demo/blob/master/pywb-ca.pem) must be added to the browser as a trusted certificate. The certificate (located in the root of this repo) should imported it into the browser as a trusted certificate for verifying websites. (This only needs to be done once).

2. Start the demo by running `./run-proxy-demo.sh`

3. Set the browser settings to `localhost:9080` by default. Set this in the browser's HTTP/S proxy as well.

4. This demo includes two urls which can be browsed in multiple collections and at multiple capture times:

   https://twitter.com/netpreserve
   
   https://plus.google.com/communities/105126210690761809187
   
   
(Note: The sites can actually be accessed via https (if configured) or http, but browser will likely force https, especially on the first url. When accessing via http, all links are rewritten to be http only as well)

When first accessing a url, the collection selection page will be shown. A link to this page will be available in the banner to allow switching of collections at any time.

In this demo, several collections are defined to have multiple combinations of captures (all of one, all older, all newer and all captures). This allows the user to try switching collections and switiching replay times within a collection,
all while in proxy mode.

The collections are defined as follows, from [config.yaml](https://github.com/ikreymer/pywb-proxy-demo/blob/master/config.yaml)

```
collections:
    all: ./samples/cdx/

    older:
        - ./samples/cdx/twitter-1.cdx
        - ./samples/cdx/gplus-1.cdx

    newer:
        - ./samples/cdx/twitter-2.cdx
        - ./samples/cdx/gplus-2.cdx

    twitter-only:
        - ./samples/cdx/twitter-1.cdx
        - ./samples/cdx/twitter-2.cdx

    gplus-only:
        - ./samples/cdx/gplus-1.cdx
        - ./samples/cdx/gplus-2.cdx

```

Although not the intent of this demo, the archives can also be accessed in non-proxy mode as well: eg. `http://localhost:8090/all/...` , `http://localhost:9080/older/...` when HTTP/S proxy is disabled



More Info
=========

Additional information about proxy mode may be found on the [pywb](https://github.com/ikreymer/pywb) project wiki:
https://github.com/ikreymer/pywb/wiki/Pywb-Proxy-Mode-Usage

Additional info about POST request replay:
https://github.com/ikreymer/pywb/wiki/POST-request-replay
