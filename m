From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.10-rc2-pa2 build failing
Date: Fri, 10 Dec 2004 12:28:35 -0700
Message-ID: <20041210192835.GF6653@colo.lackof.org>
References: <Pine.LNX.4.58.0412031551120.3169@rray.drdc.mstc.ms.gov>
	<20041204190201.GC30126@colo.lackof.org>
	<Pine.LNX.4.58.0412060817380.21506@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: rray@tcmail.mstc.state.ms.us
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0412060817380.21506@rray.drdc.mstc.ms.gov>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 06, 2004 at 09:03:03AM -0600, rray@tcmail.mstc.state.ms.us wrote:
> Enabling CONFIG_FRAMEBUFFER_CONSOLE fixed the problem.

good.

> I was able to to complete the build.
> I've attached my .config
> 
> But I get a kernel panic when I boot.
...
> Backtrace:
>  [<1031d594>] ncr53c8xx_intr+0x4c/0xbc
>  [<10107ad8>] do_irq+0xbc/0x19c
>  [<10107c48>] do_cpu_irq_mask+0x90/0xf0
>  [<1010d068>] intr_return+0x0/0x24
>  [<10113fc8>] machine_restart+0x0/0x2c
> Kernel Fault: Code=26 regs=10ac4500 (Addr=00000114)

Can you remind me which platform you are booting this on?

> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001110 Not tainted
> r00-03  00000000 1049a810 1031c2b0 27e7f000
> r04-07  00000000 00000000 27e7e000 00000000
> r08-11  27e7e458 00000001 10508010 10489810
> r12-15  000000f2 00000001 000000fd 000000f3
> r16-19  10ac4100 00000002 f0000064 00000003
> r20-23  00000001 00000000 f1800800 27e7e458
> r24-27  ffffffff 00000006 27e7e000 10487010
> r28-31  0000000e 105c2810 10ac4500 00000040
> sr0-3   00000000 00000000 00000000 00000000
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 1031c2b8 1031c2bc
>  IIR: 68e50228    ISR: 00000000  IOR: 00000114
>  CPU:        1   CR30: 10ac4000 CR31: f004f000
>  ORIG_R28: 105bab7c
>  IAOQ[0]: ncr_int_sir+0x414/0x80c
>  IAOQ[1]: ncr_int_sir+0x418/0x80c
>  RP(r2): ncr_int_sir+0x40c/0x80c

This is clearly a driver bug. I have no clue about
that particular driver though and can't look at it now.
I hope someone else can.

thanks for the report,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
