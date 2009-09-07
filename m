From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Transition hppa from linuxthreads to nptl is ready to proceed.
Date: Mon, 7 Sep 2009 17:54:01 -0400
Message-ID: <119aab440909071454s7923b95atce6f5f5a7e5b469d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: GNU Libc Maintainers <debian-glibc@lists.debian.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Aurelien Jarno <aurelien@aurel
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Aurelian,

The following patches implement version 2 of the NPTL upgrade for
hppa. This second version is a rewrite of internal pthread structures
and is 100% ABI backwards compatible. All old applications will run
with the new glibc, including during partial upgrades.

I have tested the following patches with eglibc_2.10.1-0exp1, the
testing has included the standard glibc regression testing, simulation
of partial upgrades, and heavy chroot testing with Xnest, and several
large multithreaded UI applications (evince, xchat, nautilus,
gnome-session etc). All tests succeeded.

* Please add the following patch to the hppa set of patches:
http://www.parisc-linux.org/~carlos/debian-final_glibc-ports-hppa-nptl.diff

* Please use this exepcted testsuite failures file:
http://www.parisc-linux.org/~carlos/debian-final_expected-results-hppa-linux-gnu-libc

* Please remove the hppa/local-nptl-compat.diff patch from the patch series.

* Please enable nptl in sysdeps/hppa.mk.

Feel free to roll out the nptl upgrade whenever is convenient for you.
I will be checking in an identical patch to glibc ports later tonight.

Please email me directly if anything is wrong or you need help.

Grant, Petr, Aurelian, thank you for reviewing this patch.

Cheers,
Carlos.
