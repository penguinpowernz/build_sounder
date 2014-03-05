build_sounder
=============

Play sounds when your rspec tests fail/pass

## Requirements

We need to use something that can play files from the command line.  I chose **mpg123** and **ogg123** which can be installed with `sudo apt-get install vorbis-tools mpg123`.  I'm sure you can [hack something else in there](https://github.com/penguinpowernz/build_sounder/blob/master/build_sounder.rb#L22) if need be.


## How to use

Put it in `~/src`:

```
mkdir ~/src
git clone git@github.com:penguinpowernz/build_sounder.git
cd build_sounder
```

Modify the sound files in `sounds.yml` to whatever files you like:

```yaml
---
:success: "/usr/share/sounds/LinuxMint/stereo/desktop-login.ogg"
:failure: "/usr/share/sounds/gnome/default/alerts/bark.ogg"
```

Copy over the `.rspec` file (careful not to overwrite other custom stuff you have):

```
cp -n .rspec ~/
```

Run your specs and you should hear some sounds!
