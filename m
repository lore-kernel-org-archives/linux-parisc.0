Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA28115
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Mar 2000 12:41:46 -0700
Message-Id: <200003131842.NAA12003@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 735 Tech Reference
To: bheadley@prismalink.com (Bryan W. Headley)
Date: Mon, 13 Mar 2000 13:42:33 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <38CD1FF5.821E4E6B@prismalink.com> from "Bryan W. Headley" at Mar 13, 2000 11:05:58 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Hi, new pa-risc boy, got a 735 that's not booting (it can find the CDROM
> fine, but xmap diag shows no hard disks, even when I have one plugged in
> externally, that works fine elsewhere.) No doubt I have things
> misconfigured. Does anyone know where hardware manual might be found? It
> might explain why there's a F/W connector, but then two other F/W-like
> connectors (unmarked) on the left-hand side (looking from front).

There are two SCSI controllers on the 735.  The F/W connector requires
differential drives which may be why the machine doesn't see your drive.
The single-ended controller connector is an HD-50.  On my 735, there is
a short jumper from the CPU module to the module for the internal hard
drive.  The two HD-50 connectors on the left (top) connect to each other
and the internal hard drive.  They don't need to be used if you are using
all external drives.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
