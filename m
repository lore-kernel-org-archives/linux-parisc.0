Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cs1-hq.oecd.org (cs1-hq.oecd.org [193.51.65.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C05B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Sep 2001 02:17:53 -0600 (MDT)
Received: from netsweep1.oecd.org (netsweep1.oecd.org [10.102.5.110])
	by cs1-hq.oecd.org (Postfix) with ESMTP id BD9E34B027
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Sep 2001 10:14:47 +0200 (CEST)
Message-ID: <C12531D038D1D011B1DB0000F8036C280A30EB6C@eosm5.oecd.org>
From: Arnaud.ATOCH@oecd.org
To: grundler@puffin.external.hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] UreStoreOptical 20xt 
Date: Tue, 4 Sep 2001 10:17:52 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Ok, thanks for coming back .

I've learn a lot and here are my conclusions :

- hpfs is OS/2 specific.
- The HP-UX fs patch came from parisc tree and did it into Linus tree
(2.4.8).
- HP-UX fs support in in the ufs module.
- Correct syntaxe for mount an HP-UX fs under Linux is : mount -t ufs -o
ufstype=hp /dev/sda /mnt/opti
- LVM fs are not so easy to handle and for now no success.

So the HP Surestore Optical 20xt is fully functionnal under Linux parisc or
x86.

Again thanks for you excellent work.

Arnaud Atoch
OECD
Paris - France

-----Original Message-----
From: Grant Grundler [mailto:grundler@puffin.external.hp.com]
Sent: Tuesday, September 04, 2001 3:34 AM
To: Arnaud.ATOCH@oecd.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] UreStoreOptical 20xt 


Arnaud.ATOCH@oecd.org wrote:
> I've loaded hfs, hpfs, udf, ufs because it was not clear which module
> provide HP-UX filesystem support.

IIRC, should only need hpfs (which also depends on ufs?..dunno anymore)
hfs == Apple's Hiearchial File System.

> Btw does the HP-UX fs support patch made it to Linus tree ?

dunno.  But didn't that patch come from the parisc-linux tree?

Anyway...you might check if those disks are under LVM control.
If so, you'll have to convert those to non-LVM storage using HPUX.
The archives for parisc-linux mailing list have a discussion on HP's
LVM issues.

BTW, You might also try to explicitly specify the hpfs type.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
