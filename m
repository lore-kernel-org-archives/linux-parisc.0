Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 21 Oct 2002 16:26:26 BST." <20021021162626.A1356@parcelfarce.linux.theplanet.co.uk>
References: <20021013044033.88A544829@dsl2.external.hp.com> <20021021155932.L5285@parcelfarce.linux.theplanet.co.uk>  <20021021162626.A1356@parcelfarce.linux.theplanet.co.uk> 
Date: Mon, 21 Oct 2002 15:58:17 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021021215818.EBA7D4829@dsl2.external.hp.com>
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
> So I think we want to change the sti() call to local_irq_enable().

I think we want to remove it all together. Since I don't have a PA2.0
book handy, PA1.1 Arch and Instruction Set Manual, page 5-141 says:
	"... Execution of an RFIR instruction when any of the
	PSW Q, I, or R bits are ones is an undefined operation."

When "handle_interrupts()" is done, execution will return to entry.S
and execute "rfir".  I expect RFIR to put I-bit back the way it was.

And anyone decoding state/insns in the trap/fault handler should read
the next page (5-142):
	"Because this sequence restores the state of the execution pipeline,
	it is possible for software to place the processor in states which
	could not result from the execution of any sequence of insns
	not involving interrupts."

Anyway,  I tried both current CVS and removing local_irq_enable().
Both "hung" in sym2 disk search. :^(
Still looking.

thanks,
grant
