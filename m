Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA05292
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 10:32:34 -0600
Message-Id: <199906211632.MAA02966@hiauly1.hia.nrc.ca>
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 21 Jun 1999 12:32:22 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990621174231.R30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 21, 99 05:42:31 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Hack to head.S
List-ID: <linux-parisc.vger.kernel.org>

A recent change to head.S was made in order to get the kernel to
successfully link.  This change places the kernel entry points
stext and _stext in the 'data' subspace $FLUFFY$.  Aside from the
dubious practice of placing code in the data space, it looks to
me that the change is wrong.

The module init/main.c uses the symbol _stext to determine the
starting address of the kernel text.  Placing the start in the
data region will give a totally erroneous result for the length
of kernel text to profile.  Probably, init/main.c should use
the origin selected for text when linking (currently, 0x8000)
as the start of the kernel text.  Then, the kernel entry points
can be moved back into the standard text space.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
