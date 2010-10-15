From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref
 refs/heads/parisc)
Date: Fri, 15 Oct 2010 16:01:42 -0400
Message-ID: <20101015200141.GH8332@bombadil.infradead.org>
References: <201010140531.o9E5VRYK010123@hera.kernel.org>
 <20101014153931.GI24144@bombadil.infradead.org>
 <4CB8B0DE.1070606@steuerkanzlei-deller.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Helge Deller <helge.deller@steuerkanzlei-deller.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CB8B0DE.1070606@steuerkanzlei-deller.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 15, 2010 at 09:51:58PM +0200, Helge Deller wrote:
>  On 10/14/2010 05:39 PM, Kyle McMartin wrote:
> >On Thu, Oct 14, 2010 at 05:31:27AM +0000, Kyle McMartin wrote:
> >>commit 7da1272547ebe96982a42292dfc833457708f4da
> >>Author: Kyle McMartin<kyle@dreadnought.i.jkkm.org>
> >>Date:   Thu Oct 14 01:02:23 2010 -0400
> >>
> >>     parisc: kill __do_IRQ
> >>
> >>     Signed-off-by: Kyle McMartin<kyle@redhat.com>
> >>
> >So, I've killed our __do_IRQ calls... Could people please test this
> >branch on a variety of machines? I've split up the changes so there's
> >logical separation between converting the CPU interrupts, and the
> >sub-interrupt sources (Superio, dino, etc.) so if your device fails
> >to interrupt, you can just git revert that bit and test the CPU
> >conversion while I fix it up.
> >
> >I *think* everything should be ok though, I've tested it on a500/rp3440
> >class machines with iosapic, but not on anything older.
> 
> c3000 is ok too. But I think it has iosapic as well.
> I will try if I can connect the 715/64 and b160L, but I'm not sure
> if I find time to do it this weekend...
> 

C3000 is a good one since it has SuperIO, I don't remember what devices
are behind it (IDE, USB, iirc...) though.

> BTW, fanotify* isn't wired up yet:
> <stdin>:1526:2: warning: #warning syscall fanotify_init not implemented
> <stdin>:1530:2: warning: #warning syscall fanotify_mark not implemented
> 

It's not enabled in 2.6.36 because of bugs:
commit 7c5347733dcc4ba0bac0baf86d99fae0561f33b7
Author: Eric Paris <eparis@redhat.com>
Date:   Mon Oct 11 18:13:31 2010 -0400

    fanotify: disable fanotify syscalls
    
Thanks for testing, Helge!
 --Kyle
