Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc171-bre9.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B9C0482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 00:53:53 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C98E1B007; Tue,  8 May 2001 07:53:25 +0100 (BST)
Date: Tue, 8 May 2001 07:53:25 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@parisc-linux.org
Message-ID: <20010508075325.O1840@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] boot-floppies (installer)
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  Paul L, Paul B and I are working on the installer.  This is where
we are currently at...

I'm posting these diffs here rather than just dopping them in cvs because
I know they are not quite right, but hopefully others will pick them up
and try building.

First debootstrap, latest source is 0.1.7, and my diff is

================================== cut ===============================
diff -ur debootstrap-0.1.7.ori/functions debootstrap-0.1.7/functions
--- debootstrap-0.1.7.ori/functions	Tue May  1 01:01:07 2001
+++ debootstrap-0.1.7/functions	Fri May  4 10:13:05 2001
@@ -69,6 +69,8 @@
 
 check_md5 () {
   # args: dest md5 size
+  # always succeed, until busybox md5sum is fixed
+  return 0
   local expmd5="$2"
   local expsize="$3"
   relmd5=`md5sum < "$1"`
diff -ur debootstrap-0.1.7.ori/woody debootstrap-0.1.7/woody
--- debootstrap-0.1.7.ori/woody	Tue May  1 01:47:26 2001
+++ debootstrap-0.1.7/woody	Mon May  7 22:11:56 2001
@@ -18,6 +18,22 @@
 	"arm")
 		base="$base setserial libgpmg1"
 		;;
+	"hppa")
+		base="$(without_package "apt-utils" "$base")"
+		base="$(without_package "console-common" "$base")"
+		base="$(without_package "console-data" "$base")"
+		base="$(without_package "console-tools" "$base")"
+		base="$(without_package "console-tools-libs" "$base")"
+		base="$(without_package "fdutils" "$base")"
+		base="$(without_package "liblockfile1" "$base")"
+		base="$base palo"
+		base="$base libstdc++3.0"
+		base="$base gcc-3.0-base"
+		required="$required libterm-stool-perl"
+		required="$required libterm-slang-perl"
+		required="$required base-config"
+		required="$(without_package "libstdc++2.10-glibc2.2" "$required")"
+		;;
 	"i386")
 		required="$(without_package "libperl5.6" "$required") mbr"
 		base="$base lilo pciutils setserial syslinux"   # pcmcia-cs
================================== cut ===============================

busybox md5sum is fixed in its master cvs, but that hasn't rippled down
to us yet.  Paul L built a .deb with the fix, on pehc:~pjlahaie.  Havn't
checked to see if I can now enable the md5sum tests.

The big list of things removed from base are more because I didn't have
.debs of them than because they were not needed.  libterm* are probably
not actually needed.

Can't get this lot upstream until we figure out what the package list
should really be.



There is a file /sbin/termwrap needed in the root.bin produced from building
the boot-floppies, which doesn't appear to belong to any package.  A quick
search showed other ports had hit the same problem.  Here it is; add it to
your root.bin before trying to use it, and don't forget to chmod +x it.

================================== cut ===============================
#!/bin/sh
######################################################################
##	Ignore some signals.
######################################################################
trap fail SIGTERM SIGINT

######################################################################
##	Set some environment variables.
######################################################################
# reads /etc/environment.
test -f /etc/environment && . /etc/environment

# Set all locale related environment variables.
LC_ALL=$LANG
export LANG LC_ALL

######################################################################
##	Display usage if no argument.
######################################################################
if [ -z "$1" ]; then
	echo "usage: $0 [-nnt] <command> [...]"
	echo "-nnt: don't run another terminal"
	exit 0
fi

######################################################################
##	Recognize terminal type.
######################################################################
case `/usr/bin/tty` in
/dev/tty|/dev/console|/dev/tty[1-9]*)
	TERMINAL=console
	;;
/dev/tty[p-za-e]*)
	TERMINAL=pseudo
	if [ ! -z "$DISPLAY" ]; then
		TERMINAL=x
	else
		case $TERM in
		rxvt|xterm*|kterm)	TERMINAL=x;;
		esac
	fi
	;;
/dev/tty[A-Z]*|/dev/cu*)
	TERMINAL=serial
	;;
esac

case $TERM in
dumb)	TERMINAL=dumb
esac

export TERMINAL

# Why don't we use dpkg-architecture? 
# Because it isn't in the base archive.

case $HOSTTYPE in 
i386)	/bin/grep -q 9800 /proc/version && SUBARCH=pc9800 ;;
esac

######################################################################
##	Select suitable terminal as wrapper.
######################################################################
WRAPPER=""

case $LANG in
ja*)	
	case $TERMINAL in
	x)
		#WRAPPER="/usr/X11R6/bin/kterm -e"
		WRAPPER="/usr/X11R6/bin/krxvt -e"
		;;
	console)
		if [ "$SUBARCH" != pc9800 -a "$TERMINAL" = console ]; then
			# Any plathome except PC9800 require jfbterm
			# to display japanese fonts on console.
			WRAPPER="/usr/bin/jfbterm -e"
		fi
		;;
	# On pseudo and serial, we couldn't know
	# that terminal can display japanese fonts...
	esac
	;;
esac

if [ "$1" = "-nnt" ]; then
	WRAPPER=""
	shift
fi

######################################################################
##	Execute Wrapper.
######################################################################
if [ ! -z "$WRAPPER" -a -x "$WRAPPER" ]; then
	$WRAPPER /bin/true && exec $WRAPPER $@
fi

exec $@

================================== cut ===============================


Next are my diffs to the boot-floppies package itself.  These are against
pehc cvs.  Some things will change - this hardwires it for serial
console, for example.  If we can handle gzipped kernel images, we
maybe don't need the enw resc3700 size, for example.

================================== cut ===============================
diff -ur -x CVS boot-floppies.ori/Makefile boot-floppies/Makefile
--- boot-floppies.ori/Makefile	Tue May  1 17:57:12 2001
+++ boot-floppies/Makefile	Mon May  7 20:29:56 2001
@@ -147,7 +147,7 @@
 	$(MAKE) root.tar.gz
 else
 ifeq ($(architecture), hppa)
-	$(MAKE) root.tar.gz
+	$(MAKE) root.tar.gz resc3700.bin drivers.tgz
 else
 	echo unsupported architecture: $(architecture); false
 endif
diff -ur -x CVS boot-floppies.ori/kernel.sh boot-floppies/kernel.sh
--- boot-floppies.ori/kernel.sh	Tue May  1 17:19:00 2001
+++ boot-floppies/kernel.sh	Mon May  7 18:05:49 2001
@@ -101,7 +101,7 @@
     cp $extractdir/boot/vmlinux-* linux$subarch
     cp $extractdir/boot/vmlinux.coff-* linux$subarch.coff
 else
-    cp $extractdir/boot/vmlinuz* linux$subarch
+    cp $extractdir/boot/vmlinuz* linux$subarch || cp $extractdir/boot/vmlinux* linux$subarch
 fi
 
 info "creating sys_map$subarch.gz"
diff -ur -x CVS boot-floppies.ori/make/hppa.vars boot-floppies/make/hppa.vars
--- boot-floppies.ori/make/hppa.vars	Tue May  1 18:17:02 2001
+++ boot-floppies/make/hppa.vars	Mon May  7 18:55:22 2001
@@ -5,6 +5,8 @@
 # see 'checks'
 tools_checks		:=
 
+arch_rootdisk_deps	:= drivers.tgz resc3700.bin
+
 # additional check rules to run, see 'checks'
 arch_addl_checks	:= 
 
diff -ur -x CVS boot-floppies.ori/make/rescue boot-floppies/make/rescue
--- boot-floppies.ori/make/rescue	Tue May  1 17:19:01 2001
+++ boot-floppies/make/rescue	Mon May  7 18:45:04 2001
@@ -40,6 +40,14 @@
 	$(ROOTCMD) ./rescue.sh $(archive) "$*" $(kver) $< \
 		2880 $(debianversion) "" $(LINGUA) $(SFONT)
 
+resc3700%.bin:	$(root_for_rescue) linux% rescue.sh $(arch_rescue_deps)
+	$(ROOTCMD) ./rescue.sh $(archive) "$*" $(kver) $< \
+		3700 $(debianversion) "" $(LINGUA) $(SFONT)
+
+resc3700.bin:	root.bin linux rescue.sh $(arch_rescue_deps)
+	$(ROOTCMD) ./rescue.sh $(archive) "$*" $(kver) $< \
+		3700 $(debianversion) "" $(LINGUA) $(SFONT)
+
 resc2880%.bin:	$(root_for_rescue) linux% rescue.sh $(arch_rescue_deps)
 	$(ROOTCMD) ./rescue.sh $(archive) "$*" $(kver) $< \
 		2880 $(debianversion) "" $(LINGUA) $(SFONT)
diff -ur -x CVS boot-floppies.ori/release.sh boot-floppies/release.sh
--- boot-floppies.ori/release.sh	Tue May  1 17:19:00 2001
+++ boot-floppies/release.sh	Mon May  7 18:53:34 2001
@@ -68,10 +68,15 @@
 
   cd $release
 
+  mkdir images-3.70
   mkdir images-2.88
   mkdir images-1.44
   mkdir images-1.20
 
+  for f in resc3700*.bin; do
+    [ ! -f $f ] || mv $f images-3.70/rescue${f#resc3700}
+  done
+
   for f in resc2880*.bin; do
     [ ! -f $f ] || mv $f images-2.88/rescue${f#resc2880}
   done
@@ -96,6 +101,7 @@
     [ ! -f $f ] || mv $f images-1.20/driver${f#drv12}
   done
 
+  rmdir images-3.70 2>/dev/null || true	# in case empty
   rmdir images-2.88 2>/dev/null || true	# in case empty
   rmdir images-1.44 2>/dev/null || true	# in case empty
   rmdir images-1.20 2>/dev/null || true	# in case empty
@@ -145,6 +151,9 @@
   ia64)
 	do_arch_ia64 $otherargs
 	;;
+  hppa)
+	do_arch_hppa $otherargs
+	;;
   *)
   	echo "Unsupported arch $arch"
 	exit 1
@@ -898,6 +907,11 @@
 }
 
 do_arch_ia64()
+{
+	echo "Nothing here yet!"
+}
+	
+do_arch_hppa()
 {
 	echo "Nothing here yet!"
 }
diff -ur -x CVS boot-floppies.ori/scripts/rootdisk/SMALL_BASE_LIST_all boot-floppies/scripts/rootdisk/SMALL_BASE_LIST_all
--- boot-floppies.ori/scripts/rootdisk/SMALL_BASE_LIST_all	Tue May  1 19:29:07 2001
+++ boot-floppies/scripts/rootdisk/SMALL_BASE_LIST_all	Mon May  7 14:44:02 2001
@@ -1,6 +1,6 @@
 bin/ash
 bin/busybox
-usr/bin/nano
+bin/nano-tiny
 etc/protocols
 sbin/MAKEDEV
 sbin/badblocks
diff -ur -x CVS boot-floppies.ori/utilities/dbootstrap/baseconfig.c boot-floppies/utilities/dbootstrap/baseconfig.c
--- boot-floppies.ori/utilities/dbootstrap/baseconfig.c	Tue May  1 17:19:01 2001
+++ boot-floppies/utilities/dbootstrap/baseconfig.c	Mon May  7 20:44:51 2001
@@ -412,6 +412,11 @@
     update_console_info();
 #endif
 
+/* Hmm, some are serial, some are graphical */
+#if #cpu (hppa)
+    update_console_info();
+#endif
+
   /* If on serial console, get rid of kbd files and setserial startup.
      The kbd package will be purged during final configuration. */
   if (serialConsole >= 0)
diff -ur -x CVS boot-floppies.ori/utilities/dbootstrap/dbootstrap.h boot-floppies/utilities/dbootstrap/dbootstrap.h
--- boot-floppies.ori/utilities/dbootstrap/dbootstrap.h	Tue May  1 17:19:01 2001
+++ boot-floppies/utilities/dbootstrap/dbootstrap.h	Mon May  7 20:47:23 2001
@@ -298,6 +298,10 @@
 # define NFSROOT                /* network boot */
 # define LOCALTIME              /* ask for GMT or localtime clock setup */
 
+#elif #cpu (hppa)
+
+# define SERIAL_CONSOLE         /* serial console recognized */
+
 #endif
 
 #ifdef DO_EJECT
================================== cut ===============================


One last thing, you need to grab debiandoc.decl from somewhere (I
found it on an x86 debian box) and put it in

boot-floppies/documentation/declaration/debiandoc.decl

so that the documentation part of the build works.


So, with that lot, and some luck, you should be able to build the
boot-floppies package.

Richard
