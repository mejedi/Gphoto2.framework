# Gphoto2.framework

The famous [libgphoto2](http://www.gphoto.org) library packaged as a native OSX framework.
One can put it into an application bundle.

Libgphoto2 APIs are somewhat sparsely documented. Probably this [blog post](http://sepharads.blogspot.ru/2011/11/camera-tethered-capturing-using.html) will be a nice thing to get started with. Gphoto2 [mailing lists](http://www.gphoto.org/mailinglists/) are often helpfull.

Gphoto supports lots and lots of [funny devices](https://github.com/mejedi/Gphoto2.framework/tree/master/libgphoto/camlibs) but we build only PTP2 camera driver since
it covers the majority of current and antiquated cameras.

## Usage (OSX specific)

1. Add the framework to your project.
2. Include _&lt;gphoto2/gphoto2.h&gt;_.
3. Link against _Gphoto2.framework_. 
4. Put the framework into your application bundle with a _Copy Files_ build phase. 
5. Please adjust your application rpath.  
   If the framework was
put into _Frameworks_ subfolder inside application bundle the value for _Runpath Search Paths_ build setting
would be *@loader_path/../Frameworks*.

## Library Versions
- libgphoto-2.5.3.1
- libusbx-1.0.16
- libtool-2.4.2

