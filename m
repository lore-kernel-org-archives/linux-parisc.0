Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02F8D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Dec 2002 18:09:14 -0700 (MST)
Date: Wed, 4 Dec 2002 20:08:45 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: debian-hppa@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, debian-glibc@lists.debian.org
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Randolph Chung <tausq@debian.org>
Message-ID: <20021205010845.GU16331@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] GNU/Libc 2.3.1 on HP-PARISC requires >= 2.4.19 kernel.
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

debian, parisc, debian-glibc,

Hi, my name is Carlos, and I cause all your nightmares with glibc on
HPPA :)

Currently in unstable for HPPA - glibc 2.3.1-5
Currently in testing  for HPPA - glibc 2.2.5-15

What?
=====
During the changeover from GNU/Libc 2.2.x to 2.3.x HPPA has changed
it's minimum GNU/Libc kernel version to 2.4.19.

Why?
====
- More testing.
- Bugs fixed in unaligned handlers.
- Trap handler fixes.
- More things than you can shake a stick at, and all thanks to the
  wonderful kernel hacking team that parisc-linux has.

No.
===
If you do not wish to upgrade your kernel then I suggest you pin glibc at
the particular version that you feel is good for you. The debian glibc
package for 2.3.1-6 has a preinst check against the system kernel version
(e.g. You can't install it without the right kernel).

Sorry.
======
I apologize for the initial oversight that meant there was no preinst
check, and one or two individuals have suffered through some serious
system reconstruction. I apologize. I really do. I owe you both beers :}

I recommend that you _do_ _not_ upgrade glibc on HPPA until 2.3.1-6.

When?
=====

glibc 2.3.1-6 is going into unstable in the next few days (time
permitting).

Thanks for your time :)

Cheers,
Carlos O'Donell.
