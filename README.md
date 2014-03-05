build_sounder
=============

Play sounds when your rspec tests fail/pass


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