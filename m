Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA05613
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 11:03:25 -0600
Message-Id: <199906211703.NAA03063@hiauly1.hia.nrc.ca>
Subject: Re: Hack to head.S
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 21 Jun 1999 13:03:15 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <no.id> from "John David Anglin" at Jun 21, 99 12:32:22 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> The module init/main.c uses the symbol _stext to determine the
> starting address of the kernel text.  Placing the start in the
> data region will give a totally erroneous result for the length
> of kernel text to profile.  Probably, init/main.c should use
> the origin selected for text when linking (currently, 0x8000)
> as the start of the kernel text.  Then, the kernel entry points
> can be moved back into the standard text space.

It looks like the symbol __text_start can be used by main.c to
determine the start of text when using the HP linker.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
