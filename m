Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA03695
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 19:25:50 -0600
Message-Id: <199906120125.VAA09547@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] booting problems
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Fri, 11 Jun 1999 21:25:47 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, jason@equator.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199906120056.UAA00587@hiauly1.hia.nrc.ca> from "John David Anglin" at Jun 11, 99 08:56:52 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > Okay, this is the same conclusion I came to.  Where should I put both
> > the data and text sengments?
> 
> Try this for the ld options: -Ttext 800 -N -s.
> 
> This links all sections in low virtual memory.  VMA and LMA for the
> .text section are 0x800 (the size of the LIF header, 2048).  The file
> offset to the .text section is 0xa0 bytes when -N is specified.  The
> size of the LIF header should be 0x800 - 0xa0 = 0x760 (1888 bytes).

This last part may be unclear.  What you need to arrange is that
the offset to the .text section in the binary image is 0x800 bytes.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
