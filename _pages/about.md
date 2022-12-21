---
permalink: /about/
title: "About"
author_profile: true
---

MatsSocket is a WebSocket-based client-server solution which bridges the asynchronous message based nature
of [Mats<sup>3</sup>](https://github.com/centiservice/mats3) all the way out to your end user client applications,
featuring bidirectional communication. It consists of a small MatsSocketServer API which is implemented on top of the _
Mats<sup>3</sup> API_ and _JSR 356 Java API for WebSockets_ (which most Servlet Containers implement), as well as client
libraries - for which there currently exists JavaScript and Dart/Flutter implementations.

While it is certainly possible to use Mats with asynchronous HTTP implementations, using e.g. Servlet's or Spring's
async modes along with the 'MatsFuturizer', the communication is still over synchronous TCP connections. If the
connection or the server temporarily goes down, you've lost any outstanding requests. Also, you have the overhead of
each HTTP request and response with all their headers. Sending many small requests is very wasteful and results in low
speed, so you might have to implement some kind of bundling. Also, sending messages from the server to the client isn't
easy.

These issues, and several other, stand in stark contrast to the nimbleness and reliability of Mats.

Thus, MatsSocket was born.

Now, go read some [documentation](/docs/)!
