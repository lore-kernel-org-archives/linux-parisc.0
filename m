Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD95055C6.dip.t-dialin.net [217.80.85.198])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD5F34A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Feb 2001 16:29:34 -0700 (MST)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f14NTRC00787
	for <parisc-linux@lists.parisc-linux.org>; Mon, 5 Feb 2001 00:29:28 +0100
Date: Mon, 5 Feb 2001 00:29:27 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0102050015450.385-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HP9000/730 problems
List-ID: <linux-parisc.vger.kernel.org>

Hello there,

i'm still trying running linux on hppa :-/

well, i tried both booting from scsi hd AND nfsroot/bootp

everytime it says (endless loop):


VFS: Mounted root (nfs filesystem) readonly

handle_interruption() pid=1 command='init'


PSW: 0000000000 [snip stack output]


(the same for booting from scsi hd)

Mhhh.

BTW, ASP Parallel Port driver is still broken (can't boot with it,
but can boot without it).

STI console is also broken (many characters are not printed or substitued
by spaces). The problems occur of course AFTER "switching console" !

But serial console works fine :)


Configuration: latest CVS kernel from 20010204 (about 17:00 UTC);
xc somewhere from november, the same for nfsroot.

I hope somebody can help!
Thanks In Advance,
  greetings (somewhat frustrated) max
