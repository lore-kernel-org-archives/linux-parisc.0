Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA21862
	for <parisc-linux@puffin.external.hp.com>; Sat, 7 Aug 1999 21:34:04 -0600
Message-Id: <199908080334.XAA04974@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] utssys?
To: sieler@allegro.com (Stan Sieler)
Date: Sat, 7 Aug 1999 23:34:25 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199908080138.SAA30921@bart.allegro.com> from "Stan Sieler" at Aug 7, 99 06:38:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> Re:
> 
> > Can anyone tell me what the utssys() system call does?  There's no manual
> > page for it.  From tusc, I can see:
> > 
> > utssys("HP-UX", 0, 0) ............................................ = 0
> 
> >From decompiling, it doesn't appear to do much.  The kernel utssys
> routine (called to handle system call (SYS_utssys, #57)), is short,
> with one external call ... to a short routine that has no procedure calls
> at all.  That's where I stopped looking.
