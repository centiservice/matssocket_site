#!/bin/sh

#
# Copying in all JavaDocs from matssocket-build to javadoc folder
# - Endre Stølsvik 2022-12-17
#

# Note the concept of "classic" vs. "modern". It refers to the IFrames that the original JavaDoc had, vs. the
# new crappy solution. The build must be done with jdk8 for "classic", and latest jdk for "modern".
# Only for "modern" will the API docs be copied.

matssocketversion="0.19"
jsclientversion="0.19"

copyJavaDoc() {

  variant=$1

  if [ "$variant" = "modern" ]; then
    echo "MODERN! Will also copy API docs alone (mats-api)"
  elif [ "$variant" = "classic" ]; then
    echo "CLASSIC! Not copying API docs mats-api."
  else
    echo "ERROR: Neither classic nor modern - stopping."
  fi

  # Assert that we're where we should be
  if [ -d '.git' -a -e 'CNAME' ]; then
    echo "Asserted location, good to go."
  else
    pwd=$(pwd)
    echo "Not in expected location, we're here: $pwd"
    exit 1
  fi

  if [ "$variant" = "modern" ]; then
    echo "Note: Variant 'modern', thus also copying API docs alone (matssocket-api)"
    mkdir -p codedoc/server/$matssocketversion/server-api
    echo "Deleting 'codedoc/server/$matssocketversion/server-api/*'"
    rm -rf codedoc/server/$matssocketversion/server-api/*
    echo "Copying in API docs from mats-api"
    cp -r ../matssocket/matssocket-server-api/build-gradle/docs/javadoc/* codedoc/server/$matssocketversion/server-api/
  fi

  # Make correct folder if not present
  mkdir -p codedoc/server/$matssocketversion/$variant
  echo "Deleting 'codedoc/server/$matssocketversion/$variant/*'"
  rm -rf codedoc/server/$matssocketversion/$variant/*
  echo "Copying in alljavadocs from root of matssocket"
  cp -r ../matssocket/build-gradle/docs/javadoc/* codedoc/server/$matssocketversion/$variant/
}

## CLASSIC JAVADOC + JSDOC

echo "## CLASSIC JAVADOC"
echo "Setting Java to 8"
jdk8.sh
java -version

echo "cd to matssocket"
cd ../matssocket/ || exit 1

echo "building javadoc"
./gradlew clean javadoc

cd ../matssocket_site/ || exit 1

echo "Copying JavaDoc"
copyJavaDoc "classic"

## MODERN JAVADOC + JSDOC

echo "## MODERN JAVADOC + JSDOC"
echo "Setting Java to 17"
jdk17.sh
java -version

echo "cd to matssocket"
cd ../matssocket/ || exit 1

echo "building javadoc and jsdoc"
./gradlew clean javadoc jsdoc

cd ../matssocket_site/ || exit 1

echo "Copying JavaDoc"
copyJavaDoc "modern"

echo "Copying JSDoc"
mkdir -p codedoc/jsclient/$jsclientversion/
echo "Deleting 'codedoc/jsclient/$jsclientversion/*'"
rm -rf codedoc/jsclient/$jsclientversion/*
echo "Copying in JSDOC from matssocket-client-javascript"
cp -r ../matssocket/matssocket-client-javascript/client/jsdoc/* codedoc/jsclient/$jsclientversion/

echo "Setting Java back to 8"
jdk8.sh
