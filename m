Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (ns1.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 767C14845
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 13:33:39 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: "'Joel Soete'" <joel.soete@freebel.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] L2000 stable with SMP and RAID
Date: Wed, 10 Jul 2002 07:41:10 +1200
Message-ID: <005801c22780$93f57770$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-reply-to: <3D2B2A80.6090103@freebel.net>
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

> For my part I would like to test RAID-1 on my B180 (2 of 9Gb).
> Could you let me know more on the RAID configuration you implemented?
> Do you have a special slice (partition) for your F0 (parisc 
> bootloader) 
> and may be also for /boot?

My RAID config is just a 2-disk RAID-0 array for testing at the moment.
Heres the raidtab (probably not a lot of use to you though):

----

raiddev                 /dev/md0
raid-level              0
nr-raid-disks           2
chunk-size              4

device                  /dev/sdb1
raid-disk               0
device                  /dev/sdc1
raid-disk               1

----

Theres a RAID-1 root howto for Debian which I have used in the past
here: http://www.james.rcpt.to/programs/debian/raid1/ 


Cheers, James
