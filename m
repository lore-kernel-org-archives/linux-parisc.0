Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE2EA4865
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 00:15:51 -0600 (MDT)
To: James Braid <james.braid@peace.com>
Subject: RE: [parisc-linux] L2000 stable with SMP and RAID
Message-ID: <1026368122.3d2d227abe9fa@webmail.tiscalinet.be>
Date: Thu, 11 Jul 2002 08:15:22 +0200 (CEST)
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
Very interesting.

Many thanks,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
