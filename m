Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA14274
	for <parisc-linux@puffin.external.hp.com>; Thu, 15 Jul 1999 15:14:31 -0600
Message-Id: <199907152114.RAA12587@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 735 experience ??
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Thu, 15 Jul 1999 17:14:35 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: frank.benke@student.uni-tuebingen.de, parisc-linux@thepuffingroup.com
In-Reply-To: <19990715230530.F25925@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jul 15, 99 11:05:30 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I tried a few days ago (July 6) and sent the console output to Alex Devries.
There were problems with cpu speed, cpu level, and the stack/user address
space seemed to encompass all memory including the kernel.  The kernel
did determine the amount of memory in the machine and the machine type
correctly.

I tried again a few days later and the boot just hung with no messages
at all.  I think the hpux ipl must have had problems with the object file.
Haven't tried the most recent version.

> 
> On Thu, Jul 15, 1999 at 10:38:53PM +0200, Frank Benke wrote:
> > 
> > are there any experiences with linux booting on the 735/125 ?
> > 
> > i will test these days.
> 
> I'd love someone to test it.. can you compile kernels yourself or would
> you like a precompiled one?
> 
> [I trust you are aware that you'll get masses of debugging crud followed
> by your computer hanging, and nowhere even close to a prompt yet.]
> 
> -- 
> Matthew Wilcox <willy@bofh.ai>
> "Windows and MacOS are products, contrived by engineers in the service of
> specific companies. Unix, by contrast, is not so much a product as it is a
> painstakingly compiled oral history of the hacker subculture." - N Stephenson
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
