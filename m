Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B779B4840
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Nov 2003 09:20:57 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AHmsR-00087Z-PU; Thu, 06 Nov 2003 16:20:55 +0000
Date: Thu, 6 Nov 2003 16:20:55 +0000
From: Matthew Wilcox <willy@debian.org>
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Unresolved symbols in 2.4.22-pa13
Message-ID: <20031106162055.GA26869@parcelfarce.linux.theplanet.co.uk>
References: <3FA956FD.4080901@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FA956FD.4080901@hrzpub.tu-darmstadt.de>
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

On Wed, Nov 05, 2003 at 09:01:01PM +0100, Ruediger Scholz wrote:
> when compiling the parport driver as a module, I get an unresolved 
> symbols error:
> -----><--------
> find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{} pcmcia
> if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.22-pa13; fi
> depmod: *** Unresolved symbols in 
> /lib/modules/2.4.22-pa13/kernel/drivers/parport/parport_pc.o
> depmod:         outsb
> depmod:         outsl
> depmod:         insb
> depmod:         insl
> -----><--------
> Can s.b. with CVS access add the necessary export symbol lines to 
> parport_pc?

I'm confused.

$ find arch/parisc -type f |xargs grep insb
arch/parisc/kernel/parisc_ksyms.c:EXPORT_SYMBOL(insb);
arch/parisc/lib/io.c:void insb (unsigned long port, void *dst, unsigned long count)

Did you perhaps configure ISA and PCI out but parport_pc in?  If so ...
user error.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
