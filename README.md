# docker-android-sdk

Run the container and mount your project directory to ``/opt/app``

## Usage
``docker run --rm -v $(pwd):/opt/app georgepapas/android-sdk:latest clean assemble``

## Environment
``ANDROID_HOME=/opt/android-sdk-linux``

``WORKDIR`` is ``/opt/app``


## ENTRYPOINT
``./gradlew`` is configured as the entrypoint

## Latest
  - Android ``SDK 24.4.1``
  - Build ``tools 23.0.3``
  - Api ``android_23``

## Tags  

### android-23
  - Android ``SDK 24.4.1``
  - Build ``tools 23.0.3``
  - Api ``android_23``
