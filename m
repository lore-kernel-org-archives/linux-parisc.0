Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA20893
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 15:26:43 -0700
Message-ID: <383088E0.99D03EAE@mindspring.com>
Date: Mon, 15 Nov 1999 17:27:44 -0500
From: rob hoppe <hoppe@mindspring.com>
MIME-Version: 1.0
To: "Ing. =?iso-8859-1?Q?Ra=FAl=20G=F3mez?= Escamilla" <rgomeze@cfe.gob.mx>
CC: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] problem with jukebox
References: <38302E5B.7C463D3@k4110.cfemex.com>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

"Ing. Raúl Gómez Escamilla" wrote:

> I am in process of changing several you scheme with HP-UX 9.x to Linux
> I have a problem with a workstation
> My hardware is a HP 9000 715/75 with 64 Mb ram, 4.2 Gb in HD, SO hp-ux
> 9.05, a jukebox MDI SCSI express Library 5-20DX  (this jukebox is all
> internal HP)
>  To make a bring updte to Linux the only hardware that I don't have
> support it is the jukebox
> Does somebody have experience in this hardware type or would it develop
> my own driver?

Raul,

This is the same as an HP magneto-optical drive.  MDI marketed the drive with
their name, to give their softwear credibility.  The drivers should be in the
model or SCSI dev xcripts. I hope this helps.

Rob
