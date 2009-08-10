From: Randolph Chung <randolph@tausq.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 10 Aug 2009 09:22:26 +0800
Message-ID: <4A7F7652.6050209@tausq.org>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca> <Pine.SOC.4.64.0907302054100.20870@math.ut.ee> <4A724818.4080909@tausq.org> <Pine.SOC.4.64.0907310923520.710@math.ut.ee> <20090805174507.GB11458@lackof.org> <Pine.SOC.4.64.0908052241550.4076@math.ut.ee> <20090806141542.bf48febf.berndg@fsim-ev.de> <20090807162242.GA18373@lackof.org> <20090808113100.37e0f4ab.berndg@fsim-ev.de> <20090809052714.GA22362@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Bernd Gietzelt <berndg@fsim-ev.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090809052714.GA22362@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
>> [    7.988000] Freeing unused kernel memory: <0>------------[ cut here ]------------
>> [    8.096000] Badness at /build/buildd/linux-2.6-2.6.30/debian/build/source_hppa_none/kernel/smp.c:369
>> [    8.104000] 
>> [    8.104000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>> [    8.108000] PSW: 00001000000001100000000000001110 Not tainted
>> [    8.116000] r00-03  000000000806000e 0000000040686fa0 0000000040182c6c 000000004058d020
>> [    8.120000] r04-07  0000000040668fa0 000000004065e7c0 00000000404f7db0 000000r08-11  0000000040686fa0 000000004065e7c0 0000000000000000 00000000406797a0
>> [    8.644000] r12-15  0000000000000001 0000000000000001 0000000000000000 0000000000000001
>> [    8.776000] r16-19  00000000f00003b0 0000000040686fa0 000000012f87cb40 00000000406d6000
>> [    8.784000] r20-23  0000000000000000 00000000406d6000 ffffffffffffffff 0000000000000001
>> [    8.788000] r24-27  0000000000000000 000000004065e7c0 00000000404f7db0 0000000040668fa0
>> [    8.796000] r28-31  0000000000000000 000000012f880490 000000012f880580 0000000000000000
>> [    8sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    9.208000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    9.340000] 
>> [    9.340000] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401829b4 00000000401829b8
>> [    9.348000]  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 0000000179de7d0c
>> [    9.356000]  CPU:        0   CR30: 000000012f880000 CR31: 0000000000008020
>> [    9.360000]  ORIG_R28: 000000000800000e
>> [    9.364000]  mp_call_function_many+0x7c/0x2f8
>> [    9.768000]  IAOQ[1]: smp_call_function_many+0x80/0x2f8
>> [    9.796000]  RP(r2): smp_call_function+0x3c/0x50
>> [    9.800000] Backtrace:
>> [    9.804000] Backtrace:
>> [    9.804000]  [<0000000040115fe8>] printk+0x40/0x50
>> [    9.804000]  [<0000000040152760>] print_tainted+0xc0/0xe0
>> [    9.804000]  [<0000000040104084>] intr_check_sig+0x0/0x38
>> [    9.804000]  [<0000000040104074>] intr_return+0x0/0x4
>> [    9.804000]  [<0000000040182c6c>] smp_call_function+0x3c/0x50
>> [    9.804000]  [<0000000040159d08>] on_each_cpu+0x28/0x68
>> [    9.804000]  [<000000004011b92c>] free_initmem+0x94/0x340
>>
>> Is there a guide "HowTo read kernel debug log"?
> 
> Not really - the best guide is the PA2.0 Instruction Set Manual:
>     http://ftp.parisc-linux.org/docs/arch/parisc2.0.pdf


> This describes pretty nicely all the registers that are
> printed in the dump.
> 
>> What mean the numbers behind the function names?
>>
>> [<memory adress>] function name + 0x*/0x*
> 
> IIRC, it's the offset and function length...but I'm not sure
> about the second value after the function name.

Yes, you are right. Although in this case the backtrace looks a bit 
inconsistent.

According to the register dump, the kernel triggered a warning ("Badness 
at. ..") which is on the line smp.c:369. The instruction that caused the 
dump is smp_call_function_many+0x7c. This function is 0x2f8 bytes long.

As others have pointed out this smp dump appears to be "harmless" and 
may not be the real culprit of the problems you are seeing.

Is there another error message further on? Your URL doesn't work for me 
either.

randolph
