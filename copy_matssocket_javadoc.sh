#!/bin/sh

#
# Copying in all JavaDocs from matssocket-build to javadoc folder
# - Endre Stølsvik 2022-12-17
#

# Note the concept of "classic" vs. "modern". It refers to the IFrames that the original JavaDoc had, vs. the
# new crappy solution. The build must be done with jdk8 for "classic", and latest jdk for "modern".
# Only for "modern" will the API docs be copied.

matssocketversion='0.19'
variant='classic'

if [ "$variant" = "modern" ]
then
  echo "MODERN! Will also copy API docs alone (mats-api)"
elif [ "$variant" = "classic" ]
then
  echo "CLASSIC! Not copying API docs mats-api."
else
  echo "ERROR: Neither classic nor modern - stopping."
fi



# Assert that we're where we should be
if [ -d '.git' -a -e 'CNAME' ]
then
  echo "Asserted location, good to go."
else
  pwd=`pwd`
  echo "Not in expected location, we're here: $pwd"
  exit 1
fi

if [ "$variant" = "modern" ]
then
  echo "Note: Variant 'modern', thus also copying API docs alone (matssocket-api)"
  mkdir -p javadoc/matssocket/$matssocketversion/server-api
  echo "Deleting 'javadoc/matssocket/$matssocketversion/server-api/*'"
  rm -rf javadoc/matssocket/$matssocketversion/server-api/*
  echo "Copying in API docs from mats-api"
  cp -r ../matssocket/matssocket-server-api/build-gradle/docs/javadoc/* javadoc/matssocket/$matssocketversion/server-api/
fi

# Make correct folder if not present
mkdir -p javadoc/matssocket/$matssocketversion/$variant
echo "Deleting 'javadoc/matssocket/$matssocketversion/$variant/*'"
rm -rf javadoc/matssocket/$matssocketversion/$variant/*
echo "Copying in alljavadocs from root of matssocket"
cp -r ../matssocket/build-gradle/docs/javadoc/* javadoc/matssocket/$matssocketversion/$variant/
