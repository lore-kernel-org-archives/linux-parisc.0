Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5673E482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Oct 2001 10:43:17 -0600 (MDT)
Message-Id: <200110141640.KAA27919@puffin.external.hp.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org, grundler@puffin.external.hp.com
Subject: Re: [parisc-linux] Kernel panic with -pa48 
In-Reply-To: Message from James Bottomley <James.Bottomley@HansenPartnership.com>
   of "Sun, 14 Oct 2001 09:28:54 CDT." <200110141428.f9EESss01949@localhost.localdomain>
Date: Sun, 14 Oct 2001 10:40:01 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

James Bottomley wrote:
> Both of these appear to have a SCSI bus running through the motherbord
> to a 50pin ribbon cable on one end and an external D50 SCSI-2 connector
> on the case.  There appears to be no termination at all on the motherboard,
> is that correct?

AFAIK, yes - that's correct. The 50-pin (narrow SE SCSI) should be terminated
on the external 50-pin high-density connecter. The 50-in ribbon cable has a
terminator at the "internal" end. It's all one bus.

> The 715/50 has slots for 3 SCSI drives along a ribbon cable which is 
> terminated at one end.

It's intended for 2 HDs and a CD-ROM or SCSI FLoppy.

>  However, I don't believe the other end would be 
> terminated unless I put a D50 SE terminator on the external connector.   Was 
> this the way they were usually delivered?

I think so.

> The 712/60 is even stranger: It has one SCSI drive housing and a short ribbon
> cable with no termination.  It looks like the correct configuration for this 
> one would be to activate the drive's termination and also put a D50 terminato
>   r 
> on the external connector?

Yes. But it works w/o termination too since the cable is vry short
if nothing external is connected.

grant
