Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA17795
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 06:13:39 -0600
Date: Fri, 16 Jul 1999 14:14:13 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Ulrich.Strelow@schering.de
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/33 experience and one question
Message-ID: <19990716141413.H25925@mencheca.ch.genedata.com>
References: <C12567B0.004168E7.00@BE2314.schering.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <C12567B0.004168E7.00@BE2314.schering.de>; from Ulrich.Strelow@schering.de on Fri, Jul 16, 1999 at 01:54:18PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 16, 1999 at 01:54:18PM +0200, Ulrich.Strelow@schering.de wrote:
[successful boot report snipped]
> And then my question:
> I think the 715/33 does  not  have a Dino or a Lasi chip (am I right?), but
>  does it have a gecko (and what is this?)?

Right, the 715 has neither DINO nor LASI.  The chips inside are labelled
OLIN and SHINKO.  http://www.thepuffingroup.com/parisc/hp9000_models.html
has no details on these chips.  Alex tells me he's trying to get
documentation on these chips, but I'll have to be patient.  The major
stumbling block with these machines is likely to be the SCSI controller
-- it's an NCR53C700 which is apparently a very nasty device; much more
nasty than the 710 which is built into LASI.

In my copious spare time, I'm stumbling through the Utah Mach sources,
trying to glean details about OLIN and SHINKO but I've had no success
so far.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
