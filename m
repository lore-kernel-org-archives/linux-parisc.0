Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA17956
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Jun 1999 01:49:03 -0600
Date: Wed, 30 Jun 1999 09:49:12 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/33]
Message-ID: <19990630094912.T30362@mencheca.ch.genedata.com>
References: <3779816D.CF8B8F02@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3779816D.CF8B8F02@thepuffingroup.com>; from Alex deVries on Tue, Jun 29, 1999 at 10:31:09PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 29, 1999 at 10:31:09PM -0400, Alex deVries wrote:
> 
> Matthew Wilcox wrote:
> 
> > Linux version 2.2.1 (willy@bmw) (gcc version egcs-2.91.60 19981201 (egcs-1.1.1
> > release)) #18
> >  Wed Jun 30 05:46:53 METDST 1999
> > 
> > at which point it hangs and I have to reset.  Excellent work.
> 
> Well, not a bad start, but what worries me is that this boot sequence
> should really go on a bit more.  I'm not quite sure where the problem
> is, it might be with some PDC calls we do within setup_arch().

It fails before it gets that far (what a joy it is to have a working
printk..):

in arch/parisc/kernel/setup.c
__initfunc(void setup_arch(char **cmdline_p,
        unsigned long * memory_start_p, unsigned long * memory_end_p))
{
        char cpuinfo_text[2000];
printk("setup_arch(%p, %p, %p)\n", cmdline_p, memory_start_p, memory_end_p);
printk("-3\n");
printk("%p\n", *cmdline_p);
printk("%s\n", *cmdline_p);
        strcpy(*cmdline_p,saved_command_line);  // copy the command-line
printk("-2\n");

I get the following printout:

setup_arch(000a0860, 000767e0, 000767e4)
-3
f000013c
 zC

and there it hangs.

> I'll upload a binary of the kernel that I know works on my A class.  I'd
> appreciate it if people could email tests of this on different machines.

When you put it up, I'll happily test it; maybe my kernel is larger than
yours and is causing something to be overwritten?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
