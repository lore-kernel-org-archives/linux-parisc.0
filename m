Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E24444829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Oct 2002 20:21:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 183SBt-0000Yr-00; Mon, 21 Oct 2002 03:21:13 +0100
Date: Mon, 21 Oct 2002 03:21:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer
Message-ID: <20021021032113.G5285@parcelfarce.linux.theplanet.co.uk>
References: <20021013044033.88A544829@dsl2.external.hp.com> <20021021005716.B27384829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021021005716.B27384829@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sun, Oct 20, 2002 at 06:57:16PM -0600
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

On Sun, Oct 20, 2002 at 06:57:16PM -0600, Grant Grundler wrote:
> Lastly, use of IPI to set_eiem() on all CPUs can probably go away.
> In 2.5, I was under the impression we no longer require globally
> disabling of interrupts - only on the local CPU.  For both 2.4
> and 2.5, parisc only needs to mask/unmask the EIEM bit on the CPU
> that is the target of that IRQ, not all CPUs. ie if the IPI
> is needed, it should just target the same CPU which will handle the
> specific external intr.

hmm.. not sure about disable_irq() -- certainly sti() is gone and __sti()
is local_irq_disable() in 2.5; but i think enable/disable_irq still act
globally.  i think this is because it's supposed to go and enable/disable
delivery of interrupts in the (io)(s)(a)pic, rather than playing with
the cpu interrupt masks.

-- 
Revolutions do not require corporate support.
