Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA12356
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 02:42:36 -0600
Date: Mon, 14 Jun 1999 10:42:28 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] It's finally sunk in: bye bye elf32
Message-ID: <19990614104228.F31472@mencheca.ch.genedata.com>
References: <3762F4BE.C09B5CA9@thepuffingroup.com> <199906131702.NAA28988@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199906131702.NAA28988@hiauly1.hia.nrc.ca>; from John David Anglin on Sun, Jun 13, 1999 at 01:02:58PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jun 13, 1999 at 01:02:58PM -0400, John David Anglin wrote:
> > So, I'm going to spend some time making the kernel build on HPUX.  I
> > know there's quite a few changes to make.  But I'll keep the elf
> > specific work, it'll help later on.
> 
> The discussion about the merits/limitations of SOM and ELF over the
> last couple of days has been extremely useful.  As Alex says, there is
> a lot of work to be done on the kernel before it is usable.  However,
> in the long run, the port must be a complete self contained system.
> That is, it must support a linker capable of generating executables
> and the kernel.

[...]

> If this does not work out, then we must fall back to ELF32 and devote
> enough effort to get elf32-hppa working at an acceptable level.

The long term goal is to support:

 * HP-UX binaries
 * parisc/elf32 Linux binaries
 * parisc/elf64 Linux binaries (on parisc 2.0 hardware)

The binfmt_som kernel support is necessary in both the short term (to
get a working shell for free) and long term which is why I decided to
do it first.  Once the kernel is built, we can then run the HPUX linker
on it, but we have a `small' bootstrap problem.  As Jeff says though,
it's worth throwing away the whole of parisc/elf32 and starting again
from scratch.  We were just hoping to not have to do that for a while..

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
