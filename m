From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] Bug#225892: [patch] on hppa build binutils targeted
	for hppa64
Date: Fri, 2 Jan 2004 14:41:34 +0100
Message-ID: <16373.29966.536645.79842__17417.965460527$1416623098$gmane$org@gargle.gargle.HOWL>
Reply-To: Matthias Klose <doko@cs.tu-berlin.de>, 225892@bugs.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: submit@bugs.debian.org
Return-Path: <debbugs@master.debian.org>
Resent-Message-ID: <handler.225892.B.107305566423472@bugs.debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Package: binutils
Version: 2.14.90.0.7
Tags: patch

Please apply the following patch to build an binutils-hppa64 package,
which is needed together with gcc-3.3-hppa64 to build the 64bit
kernels for hppa-linux. The tools currently used to build the 64bit
aren't packaged at all, so this is a first step ...

Binary packages currently can be found at
http://cs.tu-berlin.de/~doko/tmp/hppa/



diff -ur binutils-2.14.90.0.7.old/debian/control binutils-2.14.90.0.7/debian/control
--- binutils-2.14.90.0.7.old/debian/control	2003-12-15 08:25:17.000000000 +0100
+++ binutils-2.14.90.0.7/debian/control	2003-12-17 22:39:10.000000000 +0100
@@ -43,6 +43,19 @@
  NORMAL USERS SHOULD NOT INSTALL THIS PACKAGE.  It's meant only for those
  requiring support for reading info from binaries from other architectures.
 
+Package: binutils-hppa64
+Architecture: hppa
+Depends: ${shlibs:Depends}, binutils (>= ${Source-Version})
+Conflicts: binutils-multiarch
+Recommends: libc6-dev
+Suggests: binutils-doc (>= ${Source-Version})
+Description: The GNU assembler, linker and binary utilities targeted for hppa64-linux
+ The programs in this package are used to assemble, link and manipulate
+ binary and object files.  They may be used in conjunction with a compiler
+ and various libraries to build programs.
+ .
+ This package is needed to build an 64bit kernel for the 64bit hppa machines.
+
 Package: binutils-doc
 Section: doc
 Architecture: all
diff -ur binutils-2.14.90.0.7.old/debian/rules binutils-2.14.90.0.7/debian/rules
--- binutils-2.14.90.0.7.old/debian/rules	2003-12-15 08:25:17.000000000 +0100
+++ binutils-2.14.90.0.7/debian/rules	2003-12-17 22:37:07.000000000 +0100
@@ -19,6 +19,7 @@
 p_dev = $(p_bin)-dev
 p_mul = $(p_bin)-multiarch
 p_doc = $(p_bin)-doc
+p_hppa64 = $(p_bin)-hppa64
 
 pwd   := $(shell pwd)
 d     = debian/tmp
@@ -26,6 +27,7 @@
 d_dev = debian/$(p_dev)
 d_mul = debian/$(p_mul)
 d_doc = debian/$(p_doc)
+d_hppa64 = debian/$(p_hppa64)
 
 install_dir    = install -d -m 755
 install_file   = install -m 644
@@ -44,6 +46,12 @@
 MULTI_VERSION = $(VERSION)-multiarch
 MULTI_ARGS    = MAKEOVERRIDES="VERSION=$(MULTI_VERSION)"
 
+HPPA64_VERSION= $(VERSION)-hppa64
+HPPA64_ARGS   = MAKEOVERRIDES="VERSION=$(HPPA64_VERSION)"
+hppa64_prefix = usr
+#hppa64_prefix = usr/hppa64-linux
+#hppa64_prefix = usr/lib/hppa64-linux
+
 ########################################
 
 # Use older gcc on m68k until test suite regressions are resolved
@@ -92,10 +100,10 @@
 
 clean: unpatch
 	$(checkdir)
-	-rm -fr builddir-multi builddir-single
+	-rm -fr builddir-multi builddir-single builddir-hppa64
 	-find . -name \*.gmo -o -name \*~ | xargs rm -f
 	-rm -f $(pwd)/test-summary
-	-rm -fr $(d_bin) $(d_dev) $(d_mul) $(d_doc)
+	-rm -fr $(d_bin) $(d_dev) $(d_mul) $(d_doc) $(d_hppa64)
 	-rm -rf debian/patched debian/tmp debian/files debian/substvars
 
 ################################################################################
@@ -150,8 +158,40 @@
 		CFLAGS="$(CFLAGS)" $(MULTI_ARGS)
 	touch build-multi-stamp
 
+################################################################################
+
+#################
+# hppa64 target #
+#################
+
+configure-hppa64-stamp: patch-stamp
+	$(checkdir)
+	rm -rf configure-hppa64-stamp \
+		builddir-hppa64
+	mkdir builddir-hppa64
+	cd builddir-hppa64 \
+	    && env CC="$(CC)" ../configure \
+		--enable-shared \
+		--prefix=/$(hppa64_prefix) \
+		--build=$(DEB_BUILD_GNU_TYPE) \
+		--host=$(DEB_BUILD_GNU_TYPE) \
+		--target=hppa64-linux
+	$(MAKE) -C builddir-hppa64 configure-host
+	touch configure-hppa64-stamp
+
+build-hppa64-stamp: configure-hppa64-stamp
+	$(checkdir)
+	$(MAKE) -C builddir-hppa64/bfd headers
+	$(MAKE) -C builddir-hppa64 \
+		CFLAGS="$(CFLAGS)" $(HPPA64_ARGS)
+	touch build-hppa64-stamp
+
+build_stamps = build-single-stamp build-multi-stamp
+ifeq ($(DEB_HOST_ARCH),hppa)
+       build_stamps += build-hppa64-stamp
+endif
 build: build-stamp
-build-stamp: build-single-stamp build-multi-stamp
+build-stamp: $(build_stamps)
 	touch build-stamp
 
 ################################################################################
@@ -160,7 +200,11 @@
 # install target #
 ##################
 
-install: install-stamp
+install_stamps = install-stamp
+ifeq ($(DEB_HOST_ARCH),hppa)
+       install_stamps += install-hppa64-stamp
+endif
+install: $(install_stamps)
 install-stamp: checkroot build-stamp
 	$(checkdir)
 
@@ -183,7 +227,7 @@
 	: # Work around bug in 2.14.90.0.7 which caused as info and
 	: # manpages to not be installed.
 	make -C builddir-single/gas/doc \
-      		mandir=$(pwd)/$(d_bin)/usr/share/man \
+		mandir=$(pwd)/$(d_bin)/usr/share/man \
 	        infodir=$(pwd)/$(d_doc)/usr/share/info install-info-am install-am
 
 	: # copy libiberty.h ... not too keen on this, but it was requested
@@ -235,6 +279,48 @@
 
 	touch install-stamp
 
+install-hppa64-stamp: checkroot build-hppa64-stamp
+	$(checkdir)
+
+	rm -fr $(d_hppa64)
+	$(install_dir) $(d_hppa64)
+	$(install_dir) $(d_hppa64)/usr/lib
+
+	: # install binutils-hppa64 stuff
+	$(MAKE) -C builddir-hppa64 \
+		CFLAGS="$(CFLAGS)" $(HPPA64_ARGS) \
+		prefix=$(pwd)/$(d_hppa64)/$(hppa64_prefix) \
+		mandir=$(pwd)/$(d_hppa64)/$(hppa64_prefix)/share/man \
+		infodir=$(pwd)/$(d_hppa64)/$(hppa64_prefix)/share/info install
+
+	: # move shared libs to the stndard path
+	mv $(d_hppa64)/$(hppa64_prefix)/hppa-linux/hppa64-linux/lib/lib*-*.so \
+		$(d_hppa64)/usr/lib/.
+
+	: # Now get rid of just about everything in binutils-hppa64
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/man
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/info
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/include
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/share
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/hppa-linux
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/lib/libiberty.a
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/lib/ldscripts
+
+	: # Strip shared libraries
+	$(STRIP) --strip-unneeded $(d_hppa64)/$(hppa64_prefix)/lib/libbfd-*so
+	$(STRIP) --strip-unneeded $(d_hppa64)/$(hppa64_prefix)/lib/libopcodes-*so
+
+	chmod ugo-x $(d_hppa64)/$(hppa64_prefix)/lib/*.so
+	$(STRIP) $(d_hppa64)/$(hppa64_prefix)/bin/*
+
+	: # Don't want /usr/<arch>-linux to exist in any package
+	rm -rf $(d_hppa64)/$(hppa64_prefix)/$(DEB_HOST_GNU_TYPE)
+
+	: # symlink include dir (this seems to be sufficient for now ...)
+	ln -sf ../include $(d_hppa64)/$(hppa64_prefix)/include
+
+	touch install-hppa64-stamp
+
 ################################################################################
 
 #######################
@@ -287,14 +373,22 @@
 	$(install_script) debian/binutils-multiarch.preinst $(d_mul)/DEBIAN/preinst
 	$(install_file) debian/binutils-multiarch.shlibs $(d_mul)/DEBIAN/shlibs
 
+ifeq ($(DEB_HOST_ARCH),hppa)
+	$(install_dir) $(d_hppa64)/DEBIAN
+endif
+
 	: # install docs
 	$(install_dir) $(d_bin)/usr/share/doc/$(p_bin)/
 	$(install_file)	debian/changelog $(d_bin)/usr/share/doc/$(p_bin)/changelog.Debian
 	$(install_file)	debian/copyright $(d_bin)/usr/share/doc/$(p_bin)/
 
 	$(install_dir) $(d_dev)/usr/share/doc/ $(d_mul)/usr/share/doc/
-	ln -s $(p_bin) $(d_dev)/usr/share/doc/$(p_dev)
-	ln -s $(p_bin) $(d_mul)/usr/share/doc/$(p_mul)
+	ln -sf $(p_bin) $(d_dev)/usr/share/doc/$(p_dev)
+	ln -sf $(p_bin) $(d_mul)/usr/share/doc/$(p_mul)
+ifeq ($(DEB_HOST_ARCH),hppa)
+	$(install_dir) $(d_hppa64)/usr/share/doc/
+	ln -sf $(p_bin) $(d_hppa64)/usr/share/doc/$(p_hppa64)
+endif
 
 	$(install_file) $(pwd)/test-summary binutils/NEWS binutils/ChangeLog.linux \
 	                debian/README.Debian $(d_bin)/usr/share/doc/$(p_bin)/
@@ -330,11 +424,22 @@
 	find $(d_mul) -type f | xargs file | grep ELF | cut -d: -f 1 | xargs dpkg-shlibdeps
 	dpkg-gencontrol -isp -P$(d_mul) -p$(p_mul)
 
+ifeq ($(DEB_HOST_ARCH),hppa)
+	rm -f debian/substvars
+	find $(d_hppa64) -type f | xargs file | grep ELF | cut -d: -f 1 | xargs dpkg-shlibdeps
+	dpkg-gencontrol -isp -P$(d_hppa64) -p$(p_hppa64)
+endif
+
 	chown -R root:root $(d_bin) $(d_dev) $(d_mul)
 	chmod -R go=rX  $(d_bin) $(d_dev) $(d_mul)
 	dpkg --build $(d_bin) ..
 	dpkg --build $(d_dev) ..
 	dpkg --build $(d_mul) ..
+ifeq ($(DEB_HOST_ARCH),hppa)
+	chown -R root:root $(d_hppa64)
+	chmod -R go=rX  $(d_hppa64)
+	dpkg --build $(d_hppa64) ..
+endif
 
 ################################################################################
 
