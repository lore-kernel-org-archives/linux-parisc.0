Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2271C484B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 Oct 2003 12:12:54 -0600 (MDT)
Date: Fri, 17 Oct 2003 14:09:12 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: debian-hppa@lists.debian.org
Message-ID: <20031017180912.GD27289@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa glibc 2.3.2-9 available for the brave testers!
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

parisc-linux,
debian-hppa,

--- CALLING ALL TESTERS! ---

glibc 2.3.2 is complete for HPPA. We've gotten rid of the following
long standing test-suite errors (bug-iconv3, and test-fenv).

The regressions in 2.3.2 were caused by incorrect handling of the PIC
register by the kernel, but fixed in glibc. Most cases for our stack
were handled incorrectly (stack grows up cases), but are fixed in this
release.

ftp://ftp.parisc-linux.org/unofficial-debs/glibc_2.3.2-9_2003-10-16/

Download all the debs and install with:

dpkg -i libc6_*.deb
(Followed by dpkg -i of the rest in any order, libc6 must install first) 

Please do this only if you consider yourself a well seasoned linux-type
person. If that dpkg install fails for any reason you might be in
trouble. I'm running these debs on all my boxes, and I've tested in a
chroot, rebuilt our toolchain, and ran lmbench, gnome-session, nautilus,
and abi-word.

http://www.baldric.uwo.ca/~carlos/a500-gnome-abiword.png

Thanks go out to everyone for all the moral support and fun! 

--- TEST IT AND REPORT BACK ... PLEASE! :) ---

== DISCLAIMER ===
I do not guarantee that these debs won't cause your computer to explode
like a pineapple grenade, showering shrapnel and fiery death on all your
loved ones.
== DISCLAIMER ===

c.
