Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA31476
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Nov 1999 06:39:04 -0700
Date: Fri, 26 Nov 1999 14:40:32 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
Message-ID: <19991126144032.A2085@genedata.com>
References: <19991124203349.J1009@mathe.stud.uni-erlangen.de> <199911242055.PAA14777@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911242055.PAA14777@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Wed, Nov 24, 1999 at 03:55:38PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 24, 1999 at 03:55:38PM -0500, John David Anglin wrote:
> The default command line now prints during the boot.  However, the system
> is still not able to open an initial console.
> 
> I removed all LASI stuff from my configuration since some of the boot
> messages made it seem that it was trying to do things that were bad.  It
> did find the ASP, however, when the LASI stuff was in.

You need to enable LASI support to get ASP support.  I'll start working
on this again as soon as I can (which may not be very soon given my
imminent change of job and continent).  Maybe I'll get a chance at
LinuxTag in Bremen.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
