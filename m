From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: c3700 boot failure (protection ID trap)
Date: Sat, 28 Jan 2012 12:13:36 -0600
Message-ID: <1327774416.2924.17.camel@dabdike.int.hansenpartnership.com>
References: <CAErSpo7ko3Tdkf9Y4jiKCQTgCpcooWnHKJtqXDVpJje3nEXgdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAErSpo7ko3Tdkf9Y4jiKCQTgCpcooWnHKJtqXDVpJje3nEXgdw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2012-01-28 at 08:30 -0700, Bjorn Helgaas wrote:
> I'm trying to test some PCI changes on a c3700, but recent kernels
> don't seem to work at all.  74ea15d909b311 (current upstream) and v3.2
> both fail as shown below.  I'm using c3000_defconfig (attached for
> 74ea15d909b311).  Should I expect this to work?

It does work for me but using a fairly custom config on a pa8800 system
(based on a debian .config):

ion:~# cat /proc/version 
Linux version 3.3.0-rc1+ (jejb@ion) (gcc version 4.2.4 (Debian 4.2.4-6))
#6 SMP Sat Jan 28 09:28:11 PST 2012

> v3.0 gets farther, but then gets into a loop of
> __find_get_block_slow() messages like this:
> 
>         ...
>         md: autorun ...
>         md: ... autorun DONE.
>         __find_get_block_slow() failed. block=0, b_blocknr=1
>         b_state=0x00000020, b_size=4096
>         device blocksize: 4096
>         __find_get_block_slow() failed. block=0, b_blocknr=1
>         ...

definitely never seen this ... and it's a bit unlikely to be a PA arch
problem, but I don't use md, so I can't really say anything definitive.

> Linux version 3.3.0-rc1+ (helgaas@c3700) (gcc version 4.3.2 (Debian 4.3.2-1.1)
>  ) #20 Fri Jan 27 19:52:08 MST 2012
> unwind_init: start = 0x1054f000, end = 0x105882c0, entries = 14636
> WARNING: Out of order unwind entry! 10550250 and 10550260
> WARNING: Out of order unwind entry! 10550260 and 10550270
> WARNING: Out of order unwind entry! 10550c40 and 10550c50
> WARNING: Out of order unwind entry! 10550c50 and 10550c60
> WARNING: Out of order unwind entry! 10550c60 and 10550c70
> WARNING: Out of order unwind entry! 10550c70 and 10550c80
> WARNING: Out of order unwind entry! 10550c90 and 10550ca0
> WARNING: Out of order unwind entry! 10550ca0 and 10550cb0
> WARNING: Out of order unwind entry! 10550cb0 and 10550cc0
> WARNING: Out of order unwind entry! 10550cc0 and 10550cd0
> WARNING: Out of order unwind entry! 10550cd0 and 10550ce0
> WARNING: Out of order unwind entry! 10550ce0 and 10550cf0
> WARNING: Out of order unwind entry! 10550cf0 and 10550d00
> WARNING: Out of order unwind entry! 10550d00 and 10550d10
> WARNING: Out of order unwind entry! 10550d10 and 10550d20
> WARNING: Out of order unwind entry! 10550d20 and 10550d30
> WARNING: Out of order unwind entry! 10550d30 and 10550d40
> WARNING: Out of order unwind entry! 10550d40 and 10550d50
> FP[0] enabled: Rev 1 Model 19
> The 32-bit Kernel has started...
> bootconsole [ttyB0] enabled
> Initialized PDC Console for debugging.
> Determining PDC firmware type: System Map.
> model 00005dc0 00000481 00000000 00000002 782636b2 100000f0 00000008 000000b2 00
> 0000b2
> vers  00000203
> CPUID vers 19 rev 7 (0x00000267)
> capabilities 0x7
> model 9000/785/C3700
> Total Memory: 1024 MB
>       _______________________________
>      < Your System ate a SPARC! Gah! >
>       -------------------------------
>              \   ^__^
>                  (__)\       )\/\
>                   U  ||----w |
>                      ||     ||
> swapper (pid 0): Protection id trap (code 7)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001110 Not tainted
> r00-03  0004ff0e 10100000 10286408 1058c548
> r04-07  000186a0 0001869f 1058c5d0 00000000
> r08-11  ffffffff 00000000 0000000a 00000000
> r12-15  ffffffff 00000011 00000020 105aad90
> r16-19  10605000 00000025 1060503c 00000000
> r20-23  00040000 0000006c 00000001 00000000
> r24-27  00040000 000186a0 00040000 10590000
> r28-31  00018000 ffffffff 1058c640 10286028
> sr00-03  00000000 00000000 00000000 00000000
> sr04-07  00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 101006dc 101006e0
>  IIR: 43ffff40    ISR: 00000000  IOR: 00000000
>  CPU:        0   CR30: 1058c000 CR31: 7fffffff
>  ORIG_R28: 00000000
>  IAOQ[0]: lstrnlen_user+0x1e0/0x146c
>  IAOQ[1]: lstrnlen_user+0x1e4/0x146c
>  RP(r2): number+0x370/0x390
> Backtrace:
>  [<10286408>] number+0x370/0x390

pass on this .. number should be in lib/vsprintf.c ... but I can't see
how that would get into lstrnlen_user, so this looks like some type of
compile problem.

What it should be trying to print out is the initrd information (if you
have one) or the percpu information if you don't.

James


