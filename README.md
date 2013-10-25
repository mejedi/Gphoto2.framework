# Gphoto2.framework

The famous [libgphoto2](http://www.gphoto.org) library packaged as a native OSX framework.
One can put it into an application bundle.

Gphoto supports lots and lots of [funny devices](https://github.com/mejedi/Gphoto2.framework/tree/master/libgphoto/camlibs) but we build only PTP2 camera driver since
it covers the majority of current and antiquated cameras.

## Usage

Straightforward. Gphoto2 install name is *@rpath/Frameworks/Gphoto2.framework/Gphoto2*,
please adjust your rpath accordingly.

## Library Versions
- libgphoto-2.5.2
- libusbx-1.0.16
- libtool-2.4.2

## About Branches

- *external.nub* — the starting point for branches named after external project
- *libtool* — [libtool](http://www.gnu.org/software/libtool/) sources
- *libusb* — [libusb](http://www.libusb.org) sources
- *libgphoto* — [libgphoto](http://www.gphoto.org) sources

Eventually external sources are updated with a newer version. This is done as follows.
First checkout the corresponding branch. Replace old sources with new sources and commit.
Now merge the branch with master.

Changes to external source code is done in *master* only; the branch named after the
external project always contains the pristine code.

