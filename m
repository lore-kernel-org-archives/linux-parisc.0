Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA19450
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Jun 1999 09:14:43 -0600
Date: Wed, 30 Jun 1999 17:14:49 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Helge Deller <deller@gmx.de>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
        Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/33]
Message-ID: <19990630171449.V30362@mencheca.ch.genedata.com>
References: <E10zHne-0007RN-00@the-village.bc.nu> <377A21E9.C22A6F25@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <377A21E9.C22A6F25@gmx.de>; from Helge Deller on Wed, Jun 30, 1999 at 03:55:53PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jun 30, 1999 at 03:55:53PM +0200, Helge Deller wrote:
> Alan Cox wrote:
> 
> > > printk("-3\n");
> > > printk("%p\n", *cmdline_p);
> > > printk("%s\n", *cmdline_p);
> > >         strcpy(*cmdline_p,saved_command_line);  // copy the command-line
> > > printk("-2\n");
> > >
> > > I get the following printout:
> > >
> > > setup_arch(000a0860, 000767e0, 000767e4)
> > > -3
> > > f000013c
> > >  zC
> >
> > f000013c is in I/O space. Is the command line really meant to point into
> > I/O space..
> 
> It was completely wrong to use strcpy() !
> Sorry, my fault !!!!!
> It is now corrected in CVS.

So it is.  Thank you very much.

Has the price of beef gone up?
[if you've not booted the kernel, there's no way you'll understand this :-)]

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
