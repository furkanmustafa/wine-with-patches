What is Wine Staging?
---------------------

**Wine Staging** is the testing area of winehq.org. It contains bug fixes and
features, which have not been integrated into the development branch yet. The
idea of Wine Staging is to provide experimental features faster to end users and
to give developers the possibility to discuss and improve their patches before
they are integrated into the main branch. More information about Wine Staging
can also be found on our website [wine-staging.com](http://wine-staging.com).

Installation
------------

Ready-to-use packages for Wine Staging are available for a variety of Linux
distributions and for Mac OS X. Just follow the
[installation instructions](https://github.com/wine-compholio/wine-staging/wiki/Installation)
for your operating system.

On most distributions the `wine-staging` package is installed to
`/opt/wine-staging`, such that multiple Wine versions can be installed in
parallel. If this is the case for your distribution, you will have to type
`/opt/wine-staging/bin/wine` instead of just `wine`. The same also applies for
other wine-specific programs like `winecfg`. To learn more about how to use
Wine Staging, please take a look at the
[usage instructions](https://github.com/wine-compholio/wine-staging/wiki/Usage).

Reporting bugs
--------------

Since WineConf 2015 Wine Staging is an official part of WineHQ, which means you
can report problems directly at https://bugs.winehq.org/. Most of the time bugs
found in Wine Staging also turn out to be present in the development branch, so
its recommended to open your bug in the "Wine" product, unless you are sure its
really "Wine Staging" specific. For problems with our binary packages, please
also open a bug report there.

Building
--------

Wine Staging is maintained as a set of patches which has to be applied on top of
the development branch. In order to build Wine Staging, the first step is to
setup a build environment for Wine, including all required dependencies. A lot
of information about that is collected in the
[WineHQ Wiki](http://wiki.winehq.org/BuildingWine).

In order to apply all Wine Staging patches it is recommended to use the
`patchinstall.sh` utility which takes care of applying all patches in the
correct order. For reference, the possible commandline arguments are:

```
Usage: ./patchinstall.sh [DESTDIR=path] [--all] [-W patchset] [patchset ...]

Autogenerated script to apply all Wine Staging patches on your Wine
source tree.

Configuration:
  DESTDIR=path         Specify the path to the wine source tree
  --all                Select all patches
  --force-autoconf     Run autoreconf and tools/make_requests after each patch
  --help               Display this help and exit
  --no-autoconf        Do not run autoreconf and tools/make_requests
  --no-patchlist       Do not apply patchlist (needed for 'wine --patches')
  --upstream-commit    Print the upstream Wine commit SHA1 and exit
  --version            Show version information and exit
  -W patchset          Exclude a specific patchset

Backends:
  --backend=patch      Use regular 'patch' utility to apply patches (default)
  --backend=epatch     Use 'epatch' to apply patches (Gentoo only)
  --backend=git-am     Use 'git am' to apply patches
  --backend=git-apply  Use 'git apply' to apply patches
  --backend=stg        Import the patches using stacked git
```

If you want to apply *all* patches with the `patch` utility, the commandline
should look similar to this:
```
./patches/patchinstall.sh DESTDIR="/path/to/wine" --all
```

Before you proceed with the compilation, please make sure that you installed all
additional build dependencies required for the Wine Staging features you are
interested in (check output of `./configure`). More information about building
Wine Staging, optional build dependencies, and hints for packagers are collected
in our [Wiki](https://github.com/wine-compholio/wine-staging/wiki/Packaging).

Contributing
------------

Wine Staging mainly concentrates on experimental features and patches which are
difficult to get into the development branch. If you have a very simple bug fix
including tests, there is usually no need to send it to Wine Staging. You can
directly contribute it to the
[development branch](http://wiki.winehq.org/SubmittingPatches). However, if you
already tried that without success, or are working on such a complex area that
you do not really think its ready for inclusion, you might want to submit it to
our Staging tree. Please open a patch submission request on
[bugs.wine-staging.com](https://bugs.wine-staging.com/) including the patch.
More information is also available in our
[Wiki](https://github.com/wine-compholio/wine-staging/wiki/Contributing).