Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp01.web.de [217.72.192.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04F79482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Feb 2003 13:07:07 -0700 (MST)
Received: from c-180-204-136.n.dial.de.ignite.net ([62.180.204.136] helo=web.de)
	by smtp.web.de with asmtp (WEB.DE(Exim) 4.95 #31)
	id 18laUj-0001VB-00
	for parisc-linux@lists.parisc-linux.org; Wed, 19 Feb 2003 21:07:05 +0100
Message-ID: <3E53E1DF.5AACBABA@web.de>
Date: Wed, 19 Feb 2003 20:58:23 +0100
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] /dev/loop0 problems in 2.5.x?
References: <20030218041653.GI15855@systemhalted>
Content-Type: text/plain; charset=us-ascii
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

Carlos O'Donell wrote:
> 
> parisc,
> 
> Works in 2.4.x, thinking of moving part of the cluster to 2.5, but I like
> to play with swap over NFS.
> 
> root@node01:/etc# /sbin/losetup /dev/loop0 /swapfile
> ioctl: LOOP_SET_FD: Inappropriate ioctl for device
> root@node01:/etc# uname -a
> Linux node01 2.5.59-pa2 #2 Thu Jan 23 00:49:22 EST 2003 parisc unknown
> unknown GNU/Linux
> 
> Do I need newer tools for playing with 2.5.x on HPPA?
> Loopback is compiled into the kernel, no modules, and I can produce the
> .config if you would like to look :)

I recently started to play around with 2.5.60 kernels. Up to now, I was not
successful in building a working kernel. Especially if the loop device was
compiled in, the kernel panicked in the following device driver (first the
network device, after removing the network device it panicked when
initializing SCSI). Without the loop device, the kernel came up to init, and
panicked then.

I was using gcc (GCC) 3.3-hammer 20030123 from CVS, and this is probably the
reason why my kernels fail. Maybe, you should try several different
compilers to build the kernel. 

If someone has a working for .config for 2.5.60, I would like to try this
configuration with a slightly newer compiler (gcc (GCC) 3.3-hammer 20030205)


Berthold
