Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA14951
	for <parisc-linux@puffin.external.hp.com>; Fri, 9 Jun 2000 19:20:34 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 10 Jun 2000 01:21:15 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA08523;
	Sat, 10 Jun 2000 11:20:55 +1000
Date: Sat, 10 Jun 2000 11:20:55 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>
cc: parisc-linux@thepuffingroup.com
Subject: [parisc-linux] hpux11 build problems.
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD8627@epixch003>
Message-ID: <Pine.LNX.4.21.0006101047110.5101-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
List-ID: <linux-parisc.vger.kernel.org>

cc'ing back to the list.  Someone may be able to give better answers than
I have (and others may find my answers useful)

On Fri, 9 Jun 2000, [iso-8859-1] SOETE Joël wrote:

> Dear Alan,
> 
> I do not know exactly if you are aware of this kind of problem but any way
> could help me in connecting me to the right people.
> I subscribe to the mailing list but no feedback?

I think you need to put [parisc-linux] in the subject somewhere.

> Thanks you advance for your help and understand,
> 	Joel
> 
> > -----Original Message-----
> > From:	SOETE Joël 
> > Sent:	Monday, May 15, 2000 8:18 AM
> > To:	'cjbeard@thepuffingroup.com'; 'adevries@thepuffingroup.com'
> > Subject:	
> > 
> > Dear Christopher and Alex,
> > 
> > I just find a workstation C110 (model 9000/777) with 2 disk of 4Gb and
> > 64Mb of memory and some time to install HP-UX 11.00 (release May 99) with
> > patch bundle March 2000.
> > 
> > I then try first to start to first install binutils but failed because
> > flex or lex not available.
> > 
> > I then install HP C compiler which bring lex and yacc. Then I retry to
> > build binutils but still failed because bison is not available (even
> > thought yacc is well available)?

flex and bison aren't actually needed to compile binutils, as the
files produced by them are in CVS.  However, when checking out a binutils
tree, you may end up with the generated files having an earlier date stamp
than their corresponding source files.  "make" then thinks they need to
be rebuilt.  To get around this problem, you can just "touch" the
generated files to update their date/time stamps.

> > Then I remove (swremove) the bundle of HP C compiler and install
> > precompiled GNU tools (bison-1.28-1,binutils-2.9.1-1, flex-2.5.4-1,
> > gcc-2.8.1-2, make-3.77-1, patch-2.5.1-1, les-3.40-1 (all.hpux-11.0.depot
> > naturally)). I then add /usr/local/bin to my PATH. Is it enough (versus
> > described problem below)?

Should be.

> > Then I try to rebuild directly the kernel and 'make oldconfig' works but
> > 'make dep' failed because did not found cpp (which stand well in the gcc
> > package).
> > 
> > I would like to have your advise. What links do I have to set or what tree
> > do I add to my PATH?

You haven't given me enough info to decide what the problem is here.  One
work-around you can use is to "touch .depend" and avoid the "make dep"
completely.  I build kernels this way;  It's safe if you always start off
from a clean directory.

> > Would it be better to work with gcc-2.8.1-1 (on Software Porting And
> > Archive Center for HPUX  (http://hpux.connect.org.uk/) it was no more
> > available) or to prefer HPUX 10.20? Or is it requested to install also
> > egcs-1.1.2-1?

You may be better off using the puffin gcc.  Is gcc-2.8.1 suitable for
hpux11?  I thought there was some problem with it, but maybe HP have
patched the version of gcc available from their site.

-- 
Linuxcare.  Support for the Revolution.
