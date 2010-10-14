From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [RFT] irq changes (was Re: [git] parisc: Changes to ref
 refs/heads/parisc)
Date: Thu, 14 Oct 2010 11:39:32 -0400
Message-ID: <20101014153931.GI24144@bombadil.infradead.org>
References: <201010140531.o9E5VRYK010123@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201010140531.o9E5VRYK010123@hera.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 14, 2010 at 05:31:27AM +0000, Kyle McMartin wrote:
> commit 7da1272547ebe96982a42292dfc833457708f4da
> Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
> Date:   Thu Oct 14 01:02:23 2010 -0400
> 
>     parisc: kill __do_IRQ
>     
>     Signed-off-by: Kyle McMartin <kyle@redhat.com>
> 

So, I've killed our __do_IRQ calls... Could people please test this
branch on a variety of machines? I've split up the changes so there's
logical separation between converting the CPU interrupts, and the
sub-interrupt sources (Superio, dino, etc.) so if your device fails
to interrupt, you can just git revert that bit and test the CPU
conversion while I fix it up.

I *think* everything should be ok though, I've tested it on a500/rp3440
class machines with iosapic, but not on anything older.

--Kyle
