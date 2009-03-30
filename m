From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 2.6.29-rc8: Badness at kernel/smp.c:329
Date: Mon, 30 Mar 2009 10:42:15 -0400
Message-ID: <20090330144215.GA25856@bombadil.infradead.org>
References: <a4423d670903181027r5370c246x9aed7055403c1c28@mail.gmail.com> <a4423d670903300239j1f863aedkece7cf4c8e9bea93@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903300239j1f863aedkece7cf4c8e9bea93@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 30, 2009 at 01:39:55PM +0400, Alexander Beregalov wrote:
> > =A0Freeing unused kernel memory: <0>------------[ cut here ]-------=
-----
> > =A0Badness at kernel/smp.c:329
> >
> > =A0 =A0 =A0YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > =A0PSW: 00000000000001001111011100001110 Not tainted
> > =A0r00-03 =A00004f70e 1058be90 101644f4 10547e90
> > =A0r04-07 =A0101004d8 00000000 104eb0e8 101004d8
> > =A0r08-11 =A000000000 00000001 10507548 105c3180
> > =A0r12-15 =A0ef821430 00000001 ef844090 1053e840
> > =A0r16-19 =A0104eae98 105c3180 10541bc0 105c4000
> > =A0r20-23 =A000000000 105c4000 00000000 00000001
> > =A0r24-27 =A000000000 101004d8 104eb0e8 104eae90
> > =A0r28-31 =A00000000e 00000000 ef8242c0 00800480
> > =A0sr00-03 =A000000000 00000000 00000000 00000000
> > =A0sr04-07 =A000000000 00000000 00000000 00000000
> >
> > =A0IASQ: 00000000 00000000 IAOQ: 101644c0 101644c4
> > =A0IIR: 03ffe01f =A0 =A0ISR: 1024037e =A0IOR: 09024260
> > =A0CPU: =A0 =A0 =A0 =A00 =A0 CR30: ef824000 CR31: 40002008
> > =A0ORIG_R28: 00000001
> > =A0IAOQ[0]: smp_call_function_many+0x2d4/0x2e0
> > =A0IAOQ[1]: smp_call_function_many+0x2d8/0x2e0
> > =A0RP(r2): smp_call_function+0x28/0x38
> > =A0Backtrace:
> > =A0[<101644f4>] smp_call_function+0x28/0x38
> > =A0[<105a4e90>] _einittext+0x0/0x10
> > =A0[<101644f4>] smp_call_function+0x28/0x38
> > =A0[<10142968>] on_each_cpu+0x1c/0x50
> > =A0[<10116e64>] free_initmem+0x60/0x1d0
> > =A0[<10116624>] init_post+0x1c/0x198
> >

this part is expected. (we sent an IPI with interrupts off...)

> > =A0------------[ cut here ]------------
> > =A0Badness at kernel/smp.c:226
> >
> > =A0 =A0 =A0YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > =A0PSW: 00000000000001001111111100001110 Tainted: G =A0 =A0 =A0 =A0=
W
> > =A0r00-03 =A00004ff0e 10507e90 101644f4 00000001
> > =A0r04-07 =A000000000 101004d8 00000000 105c4000
> > =A0r08-11 =A0105a4ea0 105a4e90 10507548 105c3180
> > =A0r12-15 =A0ef821430 00000001 ef844090 1053e840
> > =A0r16-19 =A0104eae98 105c3180 10541bc0 0000000e
> > =A0r20-23 =A000000002 104eb0e8 0000001e 00000001
> > =A0r24-27 =A000000000 101004d8 00000001 104eae90
> > =A0r28-31 =A0ef824000 00000000 ef8242c0 00000001
> > =A0sr00-03 =A000000000 00000000 00000000 00000000
> > =A0sr04-07 =A000000000 00000000 00000000 00000000
> >
> > =A0IASQ: 00000000 00000000 IAOQ: 10164138 1016413c
> > =A0IIR: 03ffe01f =A0 =A0ISR: 1024037e =A0IOR: 09024264
> > =A0CPU: =A0 =A0 =A0 =A00 =A0 CR30: ef824000 CR31: 40002008
> > =A0ORIG_R28: 00000001
> > =A0IAOQ[0]: smp_call_function_single+0xa0/0x154
> > =A0IAOQ[1]: smp_call_function_single+0xa4/0x154
> > =A0RP(r2): smp_call_function+0x28/0x38
> > =A0Backtrace:
> > =A0[<101644f4>] smp_call_function+0x28/0x38
> > =A0[<1016a6e0>] __irq_set_trigger+0xa4/0xdc
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> > =A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> >

this part is a bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
