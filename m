Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FB5C482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 08:54:10 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] evms_vgscan crash hppa kernel ... continue
Message-ID: <1008172443.3c177d9bc3990@webmail.tiscalinet.be>
Date: Wed, 12 Dec 2001 16:54:03 +0100 (CET)
From: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>
References: <1005144976.3be94b9093186@webmail.tiscalinet.be> <20011107150235.G4441@parcelfarce.linux.theplanet.co.uk> <1005146018.3be94fa245586@webmail.tiscalinet.be>
In-Reply-To: <1005146018.3be94fa245586@webmail.tiscalinet.be>
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

Hi all,

I retry now with kernel 2.4.16-pa16 and evms cvs dated 2011-12-11 and
unfortunately it still crashes but at crash time I've got he following
interesting message to me:

--evms: Sector IO ioctl: Allocating sector buffer.
WARNING! Stack pointer and cr30 do not correspond!

.... a dump ...


Can some one explain me what it means and what can be the reason.
I post here the question because I see that it cames from
arch/parisc/kernel/traps.c but have no knowledge in the register naming for this
processor.

Thanks in advance for help,
        Joel


Quoting joel.soete@freebel.net:

> Quoting Matthew Wilcox <willy@debian.org>:
> 
> > On Wed, Nov 07, 2001 at 03:56:16PM +0100, joel.soete@freebel.net
> wrote:
> > > IASQ: 00000000 00000000 IAOQ: 1018c350 1018c354
> > >  IIR: 48fa0020    ISR: 00000000  IOR: faf00918
> > >  CPU:        0   CR30: 124fc000 CR31: 10348000
> > >  ORIG_R28: 124fc508
> > > 
> > > a "grep 1018c3 /boot/System.map"
> > > 1018c394 t evms_ioctl_cmd_get_minor
> > > 
> > > I would like to debug this by obtaining a core dump of the kernel
> > after the 
> > > reboot but I do not know how? (I did not find back the mail
> explaining
> > how to do 
> > > it in detail)
> > 
> > 1018c350 is before 1018c394, so it's actually in the previous
> function.
> 
> Well ... in System.map I found:
> 
> 1018bfc4 t evms_ioctl_cmd_get_logical_disk
> 1018c088 t evms_ioctl_cmd_get_logical_disk_info
> 1018c1c8 t evms_ioctl_cmd_sector_io
> 1018c394 t evms_ioctl_cmd_get_minor
> 1018c494 t evms_ioctl_cmd_get_volume_data
> 
> So it should be in 'evms_ioctl_cmd_sector_io', is it right?
> 
> Thank Matthew,
>     Joel
> 
> > 
> > -- 
> > Revolutions do not require corporate support.
> > 
> > 
> 
> 
> -------------------------------------------------
> This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
