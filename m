Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B28654837
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 08:59:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 183e1k-0008Ti-00; Mon, 21 Oct 2002 15:59:32 +0100
Date: Mon, 21 Oct 2002 15:59:32 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer
Message-ID: <20021021155932.L5285@parcelfarce.linux.theplanet.co.uk>
References: <20021013044033.88A544829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021013044033.88A544829@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sat, Oct 12, 2002 at 10:40:33PM -0600
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

On Sat, Oct 12, 2002 at 10:40:33PM -0600, Grant Grundler wrote:
> The problem is we shouldn't see *any* interrupts, not even timers.
> scsi_register_host() used spin_lock_irqsave() to acquire io_request_lock.
> Either someone is clobbering the irqsave or it's being ignored.
> That's the part the still needs to be worked out.

I wonder if this is interesting:

void handle_interruption(int code, struct pt_regs *regs)
{
        unsigned long fault_address = 0;
        unsigned long fault_space = 0;
        struct siginfo si;

        if (code == 1)
            pdc_console_restart();  /* switch back to pdc if HPMC */
        else
            sti();

so if we take, say, a page fault, we reenable interrupts on all CPUs.
Who the hell put this code in there?!

Thanks to Thibaut for finding this particular excrescence during
CONFIG_SMP frobbing on 2.5.  I'm not sure what this should be changed to.
local_irq_enable?  Do we want interrupts enabled at this point?

-- 
Revolutions do not require corporate support.
