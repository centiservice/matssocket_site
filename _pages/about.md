---
permalink: /about/
title: "About"
---

MatsSocket brings the power of asynchronous messaging all the way out to the client - assuming that the client is
written in JavaScript, TypeScript, Dart or Flutter!

While it is certainly possible to use Mats with asynchronous HTTP implementations, using e.g. Servlet's or Spring's
async modes, the communication is still over synchronous TCP connections. If the connection or the server temporarily
goes down, you've lost any outstanding requests. Also, you have the overhead of each HTTP request and response with all
their headers. Also, sending messages from the server to the client isn't easy.

These issues and more, are in stark contrast to the reliability and nimbleness of Mats.

Thus, MatsSocket was born. 


