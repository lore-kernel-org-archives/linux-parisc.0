Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA28372
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Mar 2000 12:59:22 -0700
Sender: bheadley@postal.interaccess.com
Message-ID: <38CD390E.AE12F307@prismalink.com>
Date: Mon, 13 Mar 2000 12:53:03 -0600
From: "Bryan W. Headley" <bheadley@prismalink.com>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] 735 Tech Reference
References: <200003131842.NAA12003@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John David Anglin wrote:

> > Hi, new pa-risc boy, got a 735 that's not booting (it can find the CDROM
> > fine, but xmap diag shows no hard disks, even when I have one plugged in
> > externally, that works fine elsewhere.) No doubt I have things
> > misconfigured. Does anyone know where hardware manual might be found? It
> > might explain why there's a F/W connector, but then two other F/W-like
> > connectors (unmarked) on the left-hand side (looking from front).
>
> There are two SCSI controllers on the 735.  The F/W connector requires
> differential drives which may be why the machine doesn't see your drive.
> The single-ended controller connector is an HD-50.  On my 735, there is
> a short jumper from the CPU module to the module for the internal hard
> drive.  The two HD-50 connectors on the left (top) connect to each other
> and the internal hard drive.  They don't need to be used if you are using
> all external drives.
>

Sounds like I need to open my box and determine if internal hard drive was removed
or not. This also explains that very short HD-50 cable (not meant to reach
anything, really). I have a nice non-differential HD to throw in as internal if
there are none inside. Don't you love eBay auctions :-) ?

>
> --
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

--
Bryan W. Headley                     Phone: 312/913-9158
Chief Technology Officer             Fax:   312/913-9155
Prisma & Company                     Email: bheadley@prismalink.com
