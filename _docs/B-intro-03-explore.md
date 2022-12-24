---
title: "Explore MatsSocket"
permalink: /docs/explore/
excerpt: "How to get your hands dirty with MatsSocket - explore, experiment, investigate, play around"
created_at: 2022-12-22T14:58
last_modified_at: 2022-12-22T14:58
classes: wide
---

For the time being, the simplest ways to explore and experiment with MatsSocket all start with checking out the
repository, and go from there.

There are quite a few integration tests which are run at build, both for the JS and Dart clients. These fire up a Jetty
"dev&test server" with a set of test-specific MatsSocket and Mats endpoints, and then repeatedly perform actual
MatsSocket connections to the server to test each feature.

> Actually, the tests fires up two Jetty instances, on port 8080 and 8081, sharing a common in-mem ActiveMQ as Mats message
> broker and common in-mem H2 Database as MatsSocket session backing. This to both showcase and test that multiple 
> MatsSocketServer instances works.

So, clone down the repository, and test and build it (you can do that in a container to be on the safer side):
```shell
./gradlew clean test build
```

After this works out, you could point your IDE to the Gradle project, and find the `MatsSocketTestServer`. Right-click
-> debug this main class, and then go to <a href="http://localhost:8080">http://localhost:8080</a> or
<a href="http://localhost:8081">http://localhost:8081</a>.

![Starting MatsSocketTestServer](/assets/images/explore/Starting_MatsSocketServer_2022-12-22_16-14.png)

Here's its JavaDoc text:

_A main class that fires up an ActiveMQ in-mem instances, and then two instances of a testing Servlet WebApp by
employing Jetty. The WebApp instances each starts a MatsFactory that connects to the common ActiveMQ instance, and then
using this MatsFactory, a JDBC Connection to a in-mem H2 database, and Jetty's standard implementation of the JSR 356
Java API for WebSockets, it creates a MatsSocketServer. A bunch of Mats endpoints are created on the MatsFactory, and a
bunch of MatsSocket endpoints are created on the MatsSocketServer, some of which utilizes the Mats endpoints. The
JavaScript and Dart client integration tests (using Node.js for the JavaScript client, and the Dart VM for the Dart
client) uses these MatsSocket endpoints to perform a bunch of tests._

_You may go to http://localhost:8080 or http://localhost:8081 and find both a few pages demoing the introspection
capabilities of the MatsSocketServer, a few test pages utilizing MatsSocket, as well as a page that interactively lets
you run the JavaScript client integration tests right in the browser using Mocha (the pages needing access to the
MatsSocket.js and JavaScript test files only work when you run this "in development", e.g. by right-click->Run inside
IntelliJ on this class, as they serve up the files directly from the directories in the project)._

## Run integration tests and explore-scripts

NOTE! You may change the JS and HTML files while running, <b>hit Ctrl+9 (build) to move them to the build directory.</b>

Here's the localhost:8081 (8080 and 8081 are identical):

![MatsSocketServer localhost:8081](/assets/images/explore/MatsSocket_localhost8081_2022-12-22_16-26.png)

Here's a run of the integration tests, "ESM-mode" straight from the source files, directly in the browser. JavaScript 
_Import maps_ are used so that the same source files can be run in both Node.js and the browser

_(Firefox seems to have some problems using import maps, even with a polyfill. These problems are not indicative of how
this would execute "in prod". Chrome doesn't seem to have the same problem. Reload often magically fixes the issue, so
there might be some async races laying here - help appreciated!)_

![MatsSocketServer integration tests in browser](/assets/images/explore/MatsSocket_integration_tests_2022-12-22_16-33.png)

## Explore the Java and JS/HTML sides

You may now explore the Java setup, and JS/HTML. Any changes to the browser side can be reloaded right away (Ctrl+9 to
rebuild and move the files into place), while if you set up new MatsSocket Endpoints or Mats Endpoints, you'll have to
restart the server to load them. Implementations of said endpoints can often be hot reloaded by e.g. IntelliJ.