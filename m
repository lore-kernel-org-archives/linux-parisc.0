Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe38.law3.hotmail.com [209.185.240.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B10B4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 03:05:53 -0600 (MDT)
From: "Alex Green" <alexdgreen@hotmail.com>
To: "Joel Soete" <joel.soete@freebel.net>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <OE51KKQpQq5pneeFUtL0000219c@hotmail.com> <3D4E4DB5.8070101@freebel.net>
Subject: Re: [parisc-linux] C3600 + Xfree86
Date: Mon, 5 Aug 2002 11:05:47 +0200
Message-ID: <OE38DKaacBkMTBvyXY100005c6c@hotmail.com>
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

Ok, I'll look at that config file, however if I do "dmesg | grep fb" it
says:

STI PCI Graphics ROM.....xxxxx ,fb at .... xxxxxxxxxxxx (32Mb)
stifb: Unsupported gfx card id 0x35acda30

Will using the X config below make X work?... how do I find the
resolution... using fbset ???, I think it reports that there is no
/dev/fb0... do i need to create this or is this another problem?

Thanks again
Alex

----- Original Message -----
From: "Joel Soete" <joel.soete@freebel.net>
To: "Alex Green" <alexdgreen@hotmail.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Monday, August 05, 2002 12:04 PM
Subject: Re: [parisc-linux] C3600 + Xfree86


> Hey Alex,
>
> Alex Green wrote:
> > Hi All,
> >
> > Well I've just got my C3600 booting,
> Great
> > however I have a problem with my
> > fxe5.  Even with X configured for the fb device, the start log for X
> > reports "unknown device".
> >
> > Can anyone help, do I need to do something special to get X running. I'm
> > used the STI kernel patch netinst image.
> >
> Do you try to use XF86Config-4 from ftp://ftp.parisc-linux.org/XFree86/
>
> Just pay attention that the actual resolution of your screen (at boot
> prompt you should find a menu which can give you this info) must match
> the 'Mode ...' you set in 'SubSection "Display"' for the rest it should
> works.
>
> Good luck,
> Joel
>
