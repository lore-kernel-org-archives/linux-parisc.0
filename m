Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D3B44829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 12:58:36 -0600 (MDT)
To: James Braid <james.braid@peace.com>
Subject: RE: [parisc-linux] L2000 stable with SMP and RAID
Message-ID: <1026404705.3d2db1618f064@webmail.tiscalinet.be>
Date: Thu, 11 Jul 2002 18:25:05 +0200 (CEST)
From: joel.soete@freebel.net
Cc: 'Joel Soete' <joel.soete@freebel.net>,
	parisc-linux@lists.parisc-linux.org
References: <005801c22780$93f57770$5e01000a@bongo>
In-Reply-To: <005801c22780$93f57770$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi James,

Quoting James Braid <james.braid@peace.com>:

> > For my part I would like to test RAID-1 on my B180 (2 of 9Gb).
> > Could you let me know more on the RAID configuration you implemented?
> > Do you have a special slice (partition) for your F0 (parisc 
> > bootloader) 
> > and may be also for /boot?
> 
> My RAID config is just a 2-disk RAID-0 array for testing at the moment.
> Heres the raidtab (probably not a lot of use to you though):
> 
> ----
> 
> raiddev                 /dev/md0
> raid-level              0
> nr-raid-disks           2
> chunk-size              4
> 
> device                  /dev/sdb1
> raid-disk               0
> device                  /dev/sdc1
> raid-disk               1
> 
> ----
> 
> Theres a RAID-1 root howto for Debian which I have used in the past
> here: http://www.james.rcpt.to/programs/debian/raid1/ 
> 
Thanks to this, I build on my second disk 
sdb1    (a F0 slice of about 16Mb)
sdb2    swap (128Mb == Physical memory size)
sdb3    /boot (about 64Mb to be able to test severall kernels)
sdb5 => md0   /      (about 1.5 Gb)

modify fstab to replace my boot device by /dev/md0;
modify palo.conf to make this disk bootable and find its kernel into /boot
partition and that works.

I just now have to complete the raidtab configuration and recover the rest of my
own slices than finaly fully rebuild md in non degraded mode and a small script
to duplicate F0 and boot slices (not yet supported as md AFAIK).

Many thanks again for your help,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
