Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA04226
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 09:42:36 -0600
Date: Mon, 21 Jun 1999 17:42:31 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Assembly error: entry.S
Message-ID: <19990621174231.R30362@mencheca.ch.genedata.com>
References: <19990621172015.P30362@mencheca.ch.genedata.com> <199906211527.LAA02313@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199906211527.LAA02313@hiauly1.hia.nrc.ca>; from John David Anglin on Mon, Jun 21, 1999 at 11:27:31AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 21, 1999 at 11:27:31AM -0400, John David Anglin wrote:
> > 
> > On Mon, Jun 21, 1999 at 11:06:27AM -0400, John David Anglin wrote:
> > > The following error occurs building the kernel:
> > > 
> > > gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
> > > entry.S:219: macro `ENTRY_NAME' used without args
> > > make[1]: *** [entry.o] Error 1
> > 
> > Delete line 219.  Oops.
> 
> and then
> 
> gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
> entry.S: Assembler messages:
> entry.S:228: Error: bad or irreducible absolute expression; zero assumed
> make[1]: *** [entry.o] Error 1

I don't know how to fix this one since I'm not sure what constants are
available.  The snippet is:

        .rept NR_syscalls-NR_Linux_syscalls
                ENTRY_NAME(sys_ni_syscall)
        .endr

which just pads the table out to the right size.  Evidently the number
256-182 = 74 is not representable.  What numbers are?  I'd guess 64 is.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
