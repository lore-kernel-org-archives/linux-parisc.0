Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA04407
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 09:55:52 -0600
Message-Id: <199906211555.LAA02636@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Assembly error: entry.S
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 21 Jun 1999 11:55:42 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990621174231.R30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 21, 99 05:42:31 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> On Mon, Jun 21, 1999 at 11:27:31AM -0400, John David Anglin wrote:
> > > 
> > > On Mon, Jun 21, 1999 at 11:06:27AM -0400, John David Anglin wrote:
> > > > The following error occurs building the kernel:
> > > > 
> > > > gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
> > > > entry.S:219: macro `ENTRY_NAME' used without args
> > > > make[1]: *** [entry.o] Error 1
> > > 
> > > Delete line 219.  Oops.
> > 
> > and then
> > 
> > gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
> > entry.S: Assembler messages:
> > entry.S:228: Error: bad or irreducible absolute expression; zero assumed
> > make[1]: *** [entry.o] Error 1
> 
> I don't know how to fix this one since I'm not sure what constants are
> available.  The snippet is:
> 
>         .rept NR_syscalls-NR_Linux_syscalls
>                 ENTRY_NAME(sys_ni_syscall)
>         .endr
> 
> which just pads the table out to the right size.  Evidently the number
> 256-182 = 74 is not representable.  What numbers are?  I'd guess 64 is.

The problem is NR_Linux_syscalls is not defined.  Define this to 182
and the file will assemble.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
