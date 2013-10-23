## About Branches

- *libtool* — [libtool](http://www.gnu.org/software/libtool/) sources
- *libusb* — [libusb](http://www.libusb.org) sources

Eventually external sources are updated with a newer version. This is done as follows.
First checkout the corresponding branch. Replace old sources with new sources and commit.
Now merge the branch with master.

Changes to external source code is done in *master* only; the branch named after the
external project always contains the pristine code.

- *external.nub* — the starting point for branches named after external project
