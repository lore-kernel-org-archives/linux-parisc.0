Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA14502
	for <parisc-linux@puffin.external.hp.com>; Thu, 15 Jul 1999 15:27:10 -0600
Date: Thu, 15 Jul 1999 23:27:38 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        frank.benke@student.uni-tuebingen.de, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735 experience ??
Message-ID: <19990715232738.G25925@mencheca.ch.genedata.com>
References: <19990715230530.F25925@mencheca.ch.genedata.com> <199907152114.RAA12587@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199907152114.RAA12587@hiauly1.hia.nrc.ca>; from John David Anglin on Thu, Jul 15, 1999 at 05:14:35PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 15, 1999 at 05:14:35PM -0400, John David Anglin wrote:
> I tried a few days ago (July 6) and sent the console output to Alex Devries.
> There were problems with cpu speed, cpu level, and the stack/user address
> space seemed to encompass all memory including the kernel.  The kernel
> did determine the amount of memory in the machine and the machine type
> correctly.
> 
> I tried again a few days later and the boot just hung with no messages
> at all.  I think the hpux ipl must have had problems with the object file.
> Haven't tried the most recent version.

You should :-)  Helge checked in some code today which apparently fixes
the booting-via-hpux problems.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
