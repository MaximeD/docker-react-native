# Disclaimer

This is a fork from [gilesp's react_native](https://github.com/gilesp/docker/tree/master/react_native).

# Usage

## Get image

Usual clone and image install:
```
> git clone https://github.com/MaximeD/docker-react-native
> cd docker-react-native

> docker build -t react-native .
```

Next you will need to have the two scripts available in your path. For example you can edit your `.bashrc` and add:
```
export PATH="$HOME/docker-react-native:$PATH"
```

## Create a new react native project

Initialize repository.
```
> react-native.sh init MyAwesomeProjet
```
(You can safey ignore errors from `npm`.)


Connect to container and install missing packages
```
> cd MyAwesomeProjet
> react-native-container.sh

dev> cd node_modules/react-native/
dev> yarn
```

## Run project

Inside container:
```
dev> adb reverse tcp:8081 tcp:8081 # you'll need android > 5.1 for this
dev> react-native start > react-start.log 2>&1 &
dev> react-native android
dev> react-native run-android
```

### Live reload

```
dev> watchman watch .
```


# Install udev rules

On your host system, you'll need to install the android udev rules if you want to connect your phone or tablet via USB and deploy the react native app directly to it. You can get the rules from http://source.android.com/source/51-android.rules and you can install them as follows:

```
wget -S -O - http://source.android.com/source/51-android.rules | sed "s/<username>/$USER/" | sudo tee >/dev/null /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
```
