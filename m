Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E08B6482B
	for <parisc-linux@parisc-linux.org>; Fri,  2 Nov 2001 04:15:50 -0700 (MST)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id MAA24341 for <parisc-linux@parisc-linux.org>; Fri, 2 Nov 2001 12:15:48 +0100 (MET)
Message-Id: <sbe28dc3.046@ms-zrt1>
Date: Fri, 02 Nov 2001 12:06:49 +0100
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <dan@bigw.org>, <parisc-linux@parisc-linux.org>
Subject: Betr.: [parisc-linux] More Install on C110: Kernel doesn't
	load...
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

>OK, I did a quick and dirty port of palo to MacOS X/Darwin and was =
able=20
>to run it on the ISO image and modify the boot blocks correctly.
>
>I've got it to boot from the CD, turned out I was burning the CD =
wrong,=20
>needed to burn with Track-At-Once with Close CD, rather than simply=20
>Disc-At-Once in EasyCD Creator on Win2k.
>
>However, when attempting to boot the kernel, I get this:
>
>Entry 00100000 first 00100000 n 4
>Segment 0 load 00100000 size 160694 mediaptr 0x1000
>Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
>Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
>Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
>
>Error: read from boot device failed (status =3D -4)
>byteio_read: seekread() returned -1 expected 2048
>Error:  segment 0 read() failed
>
>Any thoughts?
>
Yeah, something's wrong :-)

It looks like palo is trying to read a file and doesn't get the 2048 bytes
it wanted (and expected). I'm not sure if this is the phase where palo
reads the kernel. If it is, double check if it is trying to read the =
correct
file.

This may indicate that either your CD is still bad, or that your hardware
in general is flaky (bad cable, bad termination, bad cdrom-drive).

Do you have another linux system and can you check if the CD is
readable on that system? A simple 'cat /dev/cdrom > /dev/null' should
mention any errors.

Good luck,
Jurriaan
