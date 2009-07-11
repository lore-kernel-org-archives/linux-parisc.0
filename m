From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Status update on NPTL
Date: Sat, 11 Jul 2009 10:17:14 -0400
Message-ID: <119aab440907110717q1c55d329jbdf17924e0929804@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Deiban hppa users,

The NPTL patches were updated to 2.10 several weeks ago, but full
chroot testing showed that more complex applications like xhcat or
xterm would crash. My usability testing involves vnc4server +
x-window-manager + serveral X applications. If anyone has any other
use cases they would like me to test, please let me know.

I've been investigating the crashes, but because of problems with gdb
and strace I've had to take it slow. Kyle, I have your recent strace
patches in my queue to test. Thanks for that.

I've been building up a test case, and I can debug a simple nptl
threaded application with gdb.

The crashes in xterm using the new nptl libraries appear to be the NSS
modules (dynamically loaded modules).

I've augmented the testcase to use NSS, but I can still successfully
debug an nptl threaded application that uses NSS.

I have a couple more ideas to test, but after that my next step is to
rebuild xterm with debugging symbols and dig in to figure out exactly
what's crashing.

Thanks for your time!

Cheers,
Carlos,
-the-hppa-glibc-maintiner
