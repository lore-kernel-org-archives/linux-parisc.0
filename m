Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B88164829
	for <parisc-linux@parisc-linux.org>; Fri,  7 Mar 2003 11:17:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18rMPc-0007Nf-00
	for parisc-linux@parisc-linux.org; Fri, 07 Mar 2003 18:17:40 +0000
Date: Fri, 7 Mar 2003 18:17:40 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030307181740.D3865@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [aj@azure.humbug.org.au: Warning: glibc 2.3.1 entering testing soon]
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

Since so many of our parisc-linux users are using debian, i thought this
was worth forwarding on.

----- Forwarded message from Anthony Towns <aj@azure.humbug.org.au> -----

Date: Sat, 8 Mar 2003 03:30:24 +1000
To: debian-devel-announce@lists.debian.org
Cc: debian-user@lists.debian.org, debian-sparc@lists.debian.org,
	debian-hppa@lists.debian.org
Subject: Warning: glibc 2.3.1 entering testing soon
From: Anthony Towns <aj@azure.humbug.org.au>

Sorry about the cross posting.

glibc 2.3.1-14 should be entering testing "tomorrow" (sometime around 30
hours from now, depending on your mirror). Along with it, some 800 other
source packages and all their binaries are expected to be updated. For
those of you running testing systems, please take care of the next few
days' upgrades, as a number of things *will* break.

php4 will be broken on all architectures. This will be fixed by the
removal of the Conflicts: line from the libc6 packages in a forthcoming
revision. It can be worked around by not upgrading until that version of
libc6 is available; by upgrading to php4 from unstable; or by manually
forcing the dependencies (and not using apt).

On sparc, the libc6-sparc64 package has been removed; this will mean
you'll be unable to install the versions of gcc-3.0, gcc-3.2, and a
number of related packages in testing. This can be worked around by not
using the versions of those packages from unstable, or by not upgrading
libc6 until new versions of the affected packages have entered testing.

On hppa, a number of programs that make use of the __clz_tab symbol will
fail to find it. That this symbol is visible was a bug in the toolchain,
that has been fixed; unfortunately the fix breaks old software, including,
eg, wget, lftp and other programs that link against libcrypto. You can
work around this problem by avoiding using the affected programs, by
rebuilding them from source, or by not upgrading libc6. Some compatability
code will be introduced in the next version of glibc so that this isn't
an issue.

Similar problems related to other symbols might appear on hppa or other
architectures. The problem is believed to have been fixed on i386, but
may not have been entirely addressed. Please report problems you find
in the usual manner.

There may be undiscovered interactions between the software that isn't
being updated yet, and the 800 packages that are being updated. Given that
so many packages are being updated in a single hit, and that a number
of core packages (gcc, perl, python, gnome, kde) will differ between
testing and unstable, this is significantly more likely than usual.

In short, please take care administering any testing systems you rely
on over the next few days.

If you wish to put libc6 on hold, you can do so at the command line by:

	# echo libc6 hold | dpkg --set-selections

or by using dselect or aptitude or similar.

Cheers,
aj

-- 
Anthony Towns <ajt@debian.org>
Debian Release Manager



----- End forwarded message -----

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
