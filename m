From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] but still panic: [WAS: 2.6.10-rc1-pa15 boot fine
	on n4k but still	annoying bactrace]
Date: 25 Nov 2004 14:39:05 -0600
Message-ID: <1101415152.2020.21.camel@mulgrave>
References: <418A80E800005C38@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A80E800005C38@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2004-11-22 at 08:10, Joel Soete wrote:
> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001016a7cc 000000001016a7d0
>  IIR: 527401a0    ISR: 0000000000000000  IOR: 00000000000000d0
>  CPU:        0   CR30: 000000004d5a0000 CR31: 00000000105f0000
>  ORIG_R28: 000000001010d18c
>  IAOQ[0]: update_one_process+0x74/0x168
>  IAOQ[1]: update_one_process+0x78/0x168
>  RP(r2): update_one_process+0x6c/0x168

As best I can tell, this is in kernel/timer.c here:

        if (p->signal && !unlikely(p->state & (EXIT_DEAD|EXIT_ZOMBIE))
&&
            psecs / HZ >= p->signal->rlim[RLIMIT_CPU].rlim_cur) {

The problem seems to be that p->signal is null, but it wasn't null when
the processor began the evaluation of the condition.  0xd0 is the 64 bit
offset of rlim[RLIMIT_CPU].rlim_cur.

If you look at the code, p->signal should be in r19 which is zero.

I have no explanation for this (other than some weird race in the signal
handling code somewhere).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
