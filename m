Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 21 Oct 2002 03:21:13 BST." <20021021032113.G5285@parcelfarce.linux.theplanet.co.uk>
References: <20021013044033.88A544829@dsl2.external.hp.com> <20021021005716.B27384829@dsl2.external.hp.com>  <20021021032113.G5285@parcelfarce.linux.theplanet.co.uk> 
Date: Sun, 20 Oct 2002 21:33:54 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021021033354.9C50E4829@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> hmm.. not sure about disable_irq() -- certainly sti() is gone and __sti()
> is local_irq_disable() in 2.5; but i think enable/disable_irq still act
> globally.  i think this is because it's supposed to go and enable/disable
> delivery of interrupts in the (io)(s)(a)pic, rather than playing with
> the cpu interrupt masks.

Normally, disable_irq() will only result in the IRQ being disabled
at the PIC. ie if a regular PCI driver calls disable_irq().
But if HP device (eg Dino/IOSAPIC) calls disable_irq(), the IRQ
is in the CPU region and we muck with EIEM.

grant
