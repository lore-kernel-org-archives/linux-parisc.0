Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.quango.net (unknown [63.102.227.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65D61482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 13:48:47 -0700 (MST)
Received: from shiftright.mail.quango.net [24.55.42.220] by quango.net [63.102.227.120]
	with SMTP (MDaemon.v3.5.1.R)
	for <parisc-linux@lists.parisc-linux.org>; Thu, 03 Jan 2002 12:42:31 -0800
Message-Id: <5.1.0.14.2.20020103124357.00af6b38@mail.quango.net>
Date: Thu, 03 Jan 2002 12:48:56 -0800
To: grundler@dsl2.external.hp.com
From: Bill Ferguson <ferguson@quango.net>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: <20020103174545.B89E3482A@dsl2.external.hp.com>
References: <Message from Bill Ferguson <ferguson@quango.net>
 <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net>
 <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Reply-To: ferguson@quango.net
Subject: [parisc-linux] Re: Upgrading 715/100 Firmware
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

At 10:45 AM 1/3/2002 -0700, you wrote:
>"scratch disk" means the whole *disk*. PDC loader doesn't know anything
>about partitions.  ie if /dev/sda is "scratch", then use
>         dd if=c7x50016.frm of=/dev/sda bs=2k


Okay..so a disk with no partitions at all?  Correct?

The term "scratch" has a different meaning to me from a different OS, as in 
a spare tape or drive that is formated but not used.

I'll try it with unpartitioned?  or just one partition?


>(Note: bs parameter doesn't do anything since the disk is 512 sectors
>no matter what we specify....just a good reminder in case we use different
>media)
>
> > I've tried booting from bootp, cdrom, tape, and now scratch disk and I
> > can't get the LIF image to work.
>
>*sigh*. bootp, tape, and disk definitely work - I've done all three.
>Are you *sure* it's a LIF image you are playing with?
>"lifls C7X50016.frm" under HPUX will display the LIF contents.
>
>Can you compare md5sum output?
>         grundler <511>md5sum *.frm
>         4d7dc913c507eda18c34e8af29352086  C7X50016.frm
>
>(This is from ftp://ftp.parisc-linux.org/kernels/715/C7X50016.frm)
>
>grant


MD5SUM matches exactly.   I think the problem is the partitions.  I'll get 
rid of that and try again.
