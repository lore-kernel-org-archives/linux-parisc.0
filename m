Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 546F04A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 12:28:06 -0700 (MST)
From: Chris Moore <cmoore@cancun.rose.hp.com>
Message-Id: <200102211938.LAA19866@cancun.rose.hp.com>
Subject: Re: [parisc-linux] CD boot help with 735
To: bheadley@interaccess.com
Date: Wed, 21 Feb 2001 11:38:23 PST
Cc: grundler@cup.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3A941545.5224D3EC@interaccess.com>; from "Bryan W. Headley" at Feb 21, 101 11:26 am
MIME-Version: 1.0
Content-Type: Message/rfc822
List-ID: <linux-parisc.vger.kernel.org>


> > > 3) Should I try, "b scsi.6.0 IPL" or without the IPL?
> >
> > Probably not. typically scsi.6.0 is the built-in hard disk.
> > Do "sea scsi" and see what shows up. CD-ROM is normally SCSI ID 2.
> > (Though it doesn't have to be).
> >
> 
> No, scsi.6.0 is the external CDROM. Everything else is on the fwscsi
> interface.

Still might be a problem with what PDC thinks is "scsi" in this
case.  scsi.6.0 means "target 6 on the scsi bus."  Since you have
two SCSI busses (the internal fw and the external) it might be
confused about what bus it's talking to.  As Grant suggested, 
"sea scsi" (or just "sea") should help.

Yes, you want the IPL on there.  IPL means "stop when you get to
the IPL (initial program loader)".  Without the IPL it's expecting
your IPL program to be ISL with an AUTO boot file to boot hp-ux.

Chris Moore
