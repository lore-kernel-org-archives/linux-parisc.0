Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44E23482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 12:42:17 -0700 (MST)
Message-Id: <m16G3eR-000Os7C@bame.riverrock.org>
To: Paul Bame <bame@riverrock.org>
Cc: Peter Mottram <peter@petescaff.com>,
	Stan Sieler <sieler@allegro.com>,
	parisc-linux@lists.parisc-linux.org, bame@www.riverrock.org
Subject: Re: [parisc-linux] LIF boot from tape? 
In-Reply-To: Your message of "Mon, 17 Dec 2001 12:39:34 MST."
             <m16G3bq-000Os7C@bame.riverrock.org>
References: <Pine.LNX.4.42.0112172026520.742-100000@r6.petescaff.com>  <m16G3bq-000Os7C@bame.riverrock.org> 
Date: Mon, 17 Dec 2001 12:42:15 -0700
From: Paul Bame <bame@riverrock.org>
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

> > I thought I had found something useful but have been unable to create a
> > tape with a LIF image on it that actually boots.
> 
> If you have an already-running system, here's how to make a tape which
> boots with the same root:
> 
> Copy your /etc/palo.conf to another file.  It should look something like
> this:
> 
> --commandline=3/boot/vmlinux root=/dev/sda3
> --recoverykernel=/boot/vmlinux
> --init-partitioned=/dev/sda
> 

In the new config file:

> Change --init-partitioned=/dev/sda to --init-tape=/tmp/lifimage
> 
> Change --commandline=3/boot/vmlinux ... to --commandline=0/vmlinux
> 
> Run palo, creating /tmp/lifimage

Specifically, 'palo -f your-new-config-file'

> 
> Copy /tmp/lifimage to tape with for example 'dd' (do not use 'tar' or 'cpio')
> .
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
