Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3A56482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Jun 2001 09:59:45 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 62A41B00C; Sat, 23 Jun 2001 17:00:25 +0100 (BST)
Date: Sat, 23 Jun 2001 17:00:25 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010623170024.G14416@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] boot-floppies build status
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I'm busy building new boot-floppies, and have run into sufficient
issues, that I thought I'd better write them down...

deboostrap, good news, I am using 0.1.13 with no local edits, but
it is not in the archive, so I built it myself.  pehc cvs is not
up to date atm.

slang...  to get rid of the problems with slang.so references I had
to

build and install slang1, slang1-dev, slang1-pic
build and install libnewt0, libnewt-dev, libnewt-pic
build and install whiptail
build and install util-linux
build nano-tiny

NOTE when building slang I hacked the rules file to specify
--host=hppa-linux on the configure line - apparently it builds a
broken pkg if you don't do that.

I needed groff-base, which isn't in the archive, so had to build it.

boot-floppies depended on a newer version of libbogl-dev than was in
the archive, so I had to build that.

I tried to build the latest busybox, but failed.  conflicting types for
blah blah blah.

The new dpkg-dev 1.9.12 seems broken; with that installed
apt-get -b source foo fails because it doesn't like the directory
foo is unpacked in to (expects base-config, gets base-config-1.0.8, or
similar).

Building util-linux had problems, maybe due to dpkg-dev, I think
debian/rules probably didn't have execute permissions.

I had trouble upgrading my box because I already had an apt 0.5.3.0.90,
which was taken as newer than the fixed one, 0.5.3.  Guess I got that
from pehc somewhere.

I'm now using boot-floppies source from debian cvs, with a couple of
local hacks to avoid library reduction and reduce language set, just
to speed up the build.  Also an edit to dbootstrap.h to default to
sid rather than woody.  That edit is in pehc cvs, but otherwise pehc cvs
needs bringing in to sync again.

I had whiptail crashing after upgrading to latest slang/newt/whiptail
from the archive, but having installed my own built pkgs that problem
seems to have gone away.

I tried to remove libstdc++3.0, but we still have things depending on
it:

slab:~# dpkg --remove libstdc++3.0
dpkg: dependency problems prevent removal of libstdc++3.0:
 tetex-bin depends on libstdc++3.0.
 telnet depends on libstdc++3.0.

telnet is part of base, so I had to build a new telnet.

An attempt to upgrade my system reports:
The following packages have been kept back
  debconf debhelper perl-modules 

but that isn't causing me a problem at the moment.

Known outstanding ussues:

keyboard generates 'unknown scancode 7f' for various keys, eg. capslock,
'|' on a uk keyboard.

Lines round dialog boxes use the wrong chars for serial console, or don't
exist for sti consoles.  Varies between stage 1 and 2 of install.  May be
better with my rebuilt newt/slang/whiptail stuff.  We'll see.

Kernel configs need ps/2 mouse support adding (Helge said he would, havn't
checked).

Kernel needs serial patch from Clement.

Kernel configs might need sound/harmony adding.  32 bit only?  Modules?

Last night an install on my 712 broke during 2nd stage, ran to the
end, but had never asked for root password, or to create a user, etc.
Some perl errors flashed by.  Date was 1970... Will try with the newer
stuff tonight.

Should we be building kernel-images optimised for each cpu type, like
x86 do -386, -486, -586, etc?

So, now b-f builds, and debootstrap seems happy with the pkgs in my
new base tree.  I'll see if it actually works later tonight.

Richard
