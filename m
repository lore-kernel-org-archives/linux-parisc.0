Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail4.nycap.rr.com (mail4-0.nyroc.rr.com [24.92.226.64])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29B26482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 16:56:57 -0600 (MDT)
Received: from cm-24-169-220-126.nycap.rr.com ([24.169.220.126])
          by mail4.nycap.rr.com (Post.Office MTA v3.5.3 release 223
          ID# 0-59787U250000L250000S0V35) with ESMTP id com
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 27 Aug 2001 18:55:44 -0400
Date: Mon, 27 Aug 2001 18:58:55 -0400 (EDT)
From: "Matthew A. Zahorik" <maz@albany.net>
To: <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20010827223739.7EAAF482B@dsl2.external.hp.com>
Message-ID: <Pine.BSF.4.33.0108271843310.268-100000@ender.tmmz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] [0.9.2] Can't install gcc-3.0, dependency problem
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

  I am trying to install pa-risc Linux on a B180L (32-bit kernel only)

  For the life of me, I can't get gcc-3.0 to install due to a dependency
loop that I can't break.

  cpp-3.0 depends on gcc-3.0-base.  (see output below)

  /etc/apt/sources.list is:

deb http://http.us.debian.org/debian unstable main contrib non-free

  If I force install the cpp-3.0 package, dselect removes it the next time
around.  (it doesn't like broken dependencies)

  Browsing through the archives didn't shed any light.  There was a
problem a little while back on the 64-bit compliation environment, but
that was just a simple apt-get dist-upgrade to fix.

  Box was installed from the 0.9.2 ISO (loopback mounted from my FreeBSD
box and served via. http).  The netboot/LIF image from the 0.9.2 CD was
used to tftp boot.  Base install was pulled from the 0.9.2 ISO.  The box
was update/dist-upgraded with the above sources.list with apt-get after
install.  The system, apart from this gcc dependency problem, is
otherwise working perfectly.

  Thanks in advance for any aid you can render!

- Matt

ps.  The LIF image in dists/woody/disks-hppa/current/ fails in base
install, looking for a version of fileutils that doesn't exist.  I'll
gladly install woody straight from the debian mirror if someone can kindly
compile a newer LIF boot-floppies image.

pa-risc:~# apt-get install cpp-3.0
Reading Package Lists... Done
Building Dependency Tree... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.

Since you only requested a single operation it is extremely likely that
the package is simply not installable and a bug report against
that package should be filed.
The following information may help to resolve the situation:

Sorry, but the following packages have unmet dependencies:
  cpp-3.0: Depends: gcc-3.0-base (< 1:3.0.2) but 1:3.0.2-0pre010826 is to
be installed
E: Sorry, broken packages
pa-risc:~# dpkg -k gcc-3.0-base
dpkg: unknown option -k

Type dpkg --help for help about installing and deinstalling packages [*];
Use dselect for user-friendly package management;
Type dpkg -Dhelp for a list of dpkg debug flag values;
Type dpkg --force-help for a list of forcing options;
Type dpkg-deb --help for help about manipulating *.deb files;
Type dpkg --licence for copyright licence and lack of warranty (GNU GPL)
[*].

Options marked [*] produce a lot of output - pipe it through `less' or
`more' !
pa-risc:~# dpkg -l gcc-3.0-base
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err:
uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  gcc-3.0-base   3.0.2-0pre0108 The GNU Compiler Collection (base
package).
pa-risc:~# apt-get -f install
Reading Package Lists... Done
Building Dependency Tree... Done
0 packages upgraded, 0 newly installed, 0 to remove and 0  not upgraded.
pa-risc:~# apt-get install gcc
Reading Package Lists... Done
Building Dependency Tree... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.

Since you only requested a single operation it is extremely likely that
the package is simply not installable and a bug report against
that package should be filed.
The following information may help to resolve the situation:

Sorry, but the following packages have unmet dependencies:
  gcc: Depends: cpp (>= 2:3.0.1-8) but it is not going to be installed
       Depends: gcc-3.0 but it is not going to be installed
       Depends: cpp-3.0 but it is not going to be installed
E: Sorry, broken packages
pa-risc:~#

-- end --
