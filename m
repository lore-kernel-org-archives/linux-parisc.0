From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Thu, 28 Apr 2005 15:42:26 -0400 (EDT)
Message-ID: <200504281942.j3SJgQvL005780@hiauly1.hia.nrc.ca>
References: <20050428190659.GD10171@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050428190659.GD10171@colo.lackof.org> from "Grant Grundler" at
	Apr 28, 2005 01:06:59 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Apr 28, 2005 at 08:58:34AM -0600, Grant Grundler wrote:
> > Grant Grundler wrote:
> > > Here's a new patch WITHOUT the s/__lp64__/CONFIG_64BIT/ changes.
> > 
> > I tested this patch on a500 and the kernel blew up when
> > /etc/init.d/firewall script was started.
> > Something in iptables triggered a WARN_ON in our smp_call_function.
> > Thinking this might be related to the missing "ssm/nop*8" sequence,
> > I removed the ifdef around the pcxt_ssm_bug so it's always used.
> > Still panics in basically the same way:
> 
> I've restored the #ifdef CONFIG_64BIT around pcxt_ssm_bug
> so my 64-bit kernels don't use it *and* disabled
> /etc/init.d/firewall so iptables doesn't get invoked.
> The system boots to a login prompt but when I ssh
> to the box, I get the following WARNON with several
> different stack traces:
> 
> Badness in smp_call_function at arch/parisc/kernel/smp.c:340
> Backtrace:
>  [<0000000010114cf0>] dump_stack+0x18/0x28
>  [<000000001011f6cc>] smp_call_function+0x474/0x480
>  [<00000000101130f8>] flush_tlb_all+0x108/0x238

> Besides the basic issue, this also implies flush_tlb_all() is
> called twice in the same code path. That might be ok if 
> flush_tlb_all() took parameters, but it does not.

Twice?

> Any clue what the basic issue is here?

flush_tlb_all doesn't call anything.  I'm guessing but I think this
implies that smp_call_function is getting called because a TLB miss
fault has occured.  It appears from the backtrace that the fault
has occurred in the part of flush_tlb_all with the REAL_MODE_PSW
flags set (W and Q).  Interrupts are off, so this causes the warning.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
