Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D57604841
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Nov 2003 15:24:19 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AHsY4-0000KH-Pc; Thu, 06 Nov 2003 22:24:16 +0000
Date: Thu, 6 Nov 2003 22:24:16 +0000
From: Matthew Wilcox <willy@debian.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Unresolved symbols in 2.4.22-pa13
Message-ID: <20031106222416.GI26869@parcelfarce.linux.theplanet.co.uk>
References: <3FA956FD.4080901@hrzpub.tu-darmstadt.de> <20031106162055.GA26869@parcelfarce.linux.theplanet.co.uk> <20031106205706.GG17497@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031106205706.GG17497@lug-owl.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Nov 06, 2003 at 09:57:06PM +0100, Jan-Benedict Glaw wrote:
> On Thu, 2003-11-06 16:20:55 +0000, Matthew Wilcox <willy@debian.org>
> wrote in message <20031106162055.GA26869@parcelfarce.linux.theplanet.co.uk>:
> > On Wed, Nov 05, 2003 at 09:01:01PM +0100, Ruediger Scholz wrote:
> 
> > Did you perhaps configure ISA and PCI out but parport_pc in?  If so ...
> > user error.
> 
> Kconfig dependancy error.

This is 2.4.  I'm not touching that config mess.

Shortly before receiving your message, I looked at it in 2.6 (which is
worth fixing).  My initial thought is:

@@ -34,7 +34,7 @@ config PARPORT
 
 config PARPORT_PC
        tristate "PC-style hardware"
-       depends on PARPORT && (!SPARC64 || PCI)
+       depends on PARPORT && (!(SPARC64 || PARISC) || PCI)
        ---help---
          You should say Y here if you have a PC-style parallel port. All
          IBM PC compatible computers and some Alphas have PC-style

But perhaps that should be:

	depends on PARPORT && (!SPARC64 || PCI) && (!PARISC || SUPERIO)

Comments?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
