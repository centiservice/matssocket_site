---
permalink: /codedoc/
title: "JavaDoc and JSDoc"
toc: true
---

There are separate code documentation for the JavaScript client and the Java Server API and 
implementation.

## JavaScript Client JSDoc

[JavaScript Client 0.19 JSDoc](jsclient/0.19/MatsSocket.html)

## Java Server JavaDoc

There are two sets of JavaDoc: A "classic" made with JDK 8, which still have the beloved JavaDoc frameset, and a
"modern" made with the most recent JDK LTS version, lacking the frameset, but with better search.

Both of these contain JavaDoc for both the MatsSocket Server API and the implementation.

In addition, there is JavaDoc for the MatsSocket Server API alone (modern style). This should be useful when
familiarizing oneself with how MatsSocket works, without the noise of the implementation.

### MatsSocket Server v0.19

- [Server API Only](server/0.19/server-api/index.html) - start with these:
  - [MatsSocketServer](server/0.19/server-api/io/mats3/matssocket/MatsSocketServer.html)
  - [AuthenticationPlugin](server/0.19/server-api/io/mats3/matssocket/AuthenticationPlugin.html)
  - [ClusterStoreAndForward](server/0.19/server-api/io/mats3/matssocket/ClusterStoreAndForward.html)
- [Classic JavaDoc](server/0.19/classic/index.html) (api and impl)
- [Modern JavaDoc](server/0.19/modern/index.html) (api and impl)

