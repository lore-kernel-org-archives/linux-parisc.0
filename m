Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA04892
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 10:16:39 -0600
Message-Id: <199906211616.MAA02913@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Assembly error: entry.S
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 21 Jun 1999 12:16:30 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990621180700.S30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 21, 99 06:07:00 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> On Mon, Jun 21, 1999 at 11:55:42AM -0400, John David Anglin wrote:
> > The problem is NR_Linux_syscalls is not defined.  Define this to 182
> > and the file will assemble.
> 
> Ah.  It was supposed to be __NR_Linux_syscalls, of course.

This is defined in asm/unistd.h.  However, it is not included.  I changed
the asm/segment.h include to asm/unistd.h since the segment.h include
is obsolete.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
