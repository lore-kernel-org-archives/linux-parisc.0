Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA03524
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 18:56:55 -0600
Message-Id: <199906120056.UAA00587@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] booting problems
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 11 Jun 1999 20:56:52 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jason@equator.com, parisc-linux@thepuffingroup.com
In-Reply-To: <37616570.19DC3853@thepuffingroup.com> from "Alex deVries" at Jun 11, 99 03:37:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Okay, this is the same conclusion I came to.  Where should I put both
> the data and text sengments?

Try this for the ld options: -Ttext 800 -N -s.

This links all sections in low virtual memory.  VMA and LMA for the
.text section are 0x800 (the size of the LIF header, 2048).  The file
offset to the .text section is 0xa0 bytes when -N is specified.  The
size of the LIF header should be 0x800 - 0xa0 = 0x760 (1888 bytes).
The -s option strips the symbols.

The result of the link can be inspected with the command:

hppa-parisc-objdump --headers ipl

Hope this works.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
