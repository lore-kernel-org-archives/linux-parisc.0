Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.quango.net (unknown [63.102.227.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90BBD482B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 14:27:42 -0700 (MST)
Received: from shiftright.mail.quango.net [24.55.42.220] by quango.net [63.102.227.120]
	with SMTP (MDaemon.v3.5.1.R)
	for <parisc-linux@lists.parisc-linux.org>; Thu, 03 Jan 2002 13:20:39 -0800
Message-Id: <5.1.0.14.2.20020103132428.00afee90@mail.quango.net>
Date: Thu, 03 Jan 2002 13:27:04 -0800
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

Now that worked!   My firmware is up to date!

Disk has to "raw" unpartitioned.   Thanks Grant!  I'll now write that FAQ 
for booting firmware I promised!

BTW. I found an old Syquest Ezdrive to use as a scratch disk, works pretty 
well since its scsi.


At 10:45 AM 1/3/2002 -0700, Grant Grundler wrote:
>Bill Ferguson wrote:
> > I know this has been asked a zillion times but bear with me.  I'm pretty
> > new to Linux, but familar with many other operating systems.
> >
> > I've got debian 0.9.3 installed on a 715/100.  Seems to work pretty well.
> >
> > My question relates to getting the firmware to a "scratch disk"  which
> > Grant speaks of in the archives (in my case sda1 set to type F0).  sdb1,
> > sdb2, sdb3, sdb4 are the disks where the Linux install resides.
>
>"scratch disk" means the whole *disk*. PDC loader doesn't know anything
>about partitions.  ie if /dev/sda is "scratch", then use
>         dd if=c7x50016.frm of=/dev/sda bs=2k
>
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
>
>
>--
>To UNSUBSCRIBE, email to debian-hppa-request@lists.debian.org
>with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
