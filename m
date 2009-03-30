From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: 2.6.29-rc8: Badness at kernel/smp.c:329
Date: Mon, 30 Mar 2009 13:39:55 +0400
Message-ID: <a4423d670903300239j1f863aedkece7cf4c8e9bea93@mail.gmail.com>
References: <a4423d670903181027r5370c246x9aed7055403c1c28@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903181027r5370c246x9aed7055403c1c28@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/3/18 Alexander Beregalov <a.beregalov@gmail.com>:
> Hi
>
> Ok, I have finally built the kernel, thanks to all.
> Machine has two PA8700 CPUs.
> kernel is 32bit
>
> 2.6.29-rc8-00174-gee568b2:
>
> =C2=A0Freeing unused kernel memory: <0>------------[ cut here ]------=
------
> =C2=A0Badness at kernel/smp.c:329
>
> =C2=A0 =C2=A0 =C2=A0YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> =C2=A0PSW: 00000000000001001111011100001110 Not tainted
> =C2=A0r00-03 =C2=A00004f70e 1058be90 101644f4 10547e90
> =C2=A0r04-07 =C2=A0101004d8 00000000 104eb0e8 101004d8
> =C2=A0r08-11 =C2=A000000000 00000001 10507548 105c3180
> =C2=A0r12-15 =C2=A0ef821430 00000001 ef844090 1053e840
> =C2=A0r16-19 =C2=A0104eae98 105c3180 10541bc0 105c4000
> =C2=A0r20-23 =C2=A000000000 105c4000 00000000 00000001
> =C2=A0r24-27 =C2=A000000000 101004d8 104eb0e8 104eae90
> =C2=A0r28-31 =C2=A00000000e 00000000 ef8242c0 00800480
> =C2=A0sr00-03 =C2=A000000000 00000000 00000000 00000000
> =C2=A0sr04-07 =C2=A000000000 00000000 00000000 00000000
>
> =C2=A0IASQ: 00000000 00000000 IAOQ: 101644c0 101644c4
> =C2=A0IIR: 03ffe01f =C2=A0 =C2=A0ISR: 1024037e =C2=A0IOR: 09024260
> =C2=A0CPU: =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 CR30: ef824000 CR31: 4=
0002008
> =C2=A0ORIG_R28: 00000001
> =C2=A0IAOQ[0]: smp_call_function_many+0x2d4/0x2e0
> =C2=A0IAOQ[1]: smp_call_function_many+0x2d8/0x2e0
> =C2=A0RP(r2): smp_call_function+0x28/0x38
> =C2=A0Backtrace:
> =C2=A0[<101644f4>] smp_call_function+0x28/0x38
> =C2=A0[<105a4e90>] _einittext+0x0/0x10
> =C2=A0[<101644f4>] smp_call_function+0x28/0x38
> =C2=A0[<10142968>] on_each_cpu+0x1c/0x50
> =C2=A0[<10116e64>] free_initmem+0x60/0x1d0
> =C2=A0[<10116624>] init_post+0x1c/0x198
>
> =C2=A0------------[ cut here ]------------
> =C2=A0Badness at kernel/smp.c:226
>
> =C2=A0 =C2=A0 =C2=A0YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> =C2=A0PSW: 00000000000001001111111100001110 Tainted: G =C2=A0 =C2=A0 =
=C2=A0 =C2=A0W
> =C2=A0r00-03 =C2=A00004ff0e 10507e90 101644f4 00000001
> =C2=A0r04-07 =C2=A000000000 101004d8 00000000 105c4000
> =C2=A0r08-11 =C2=A0105a4ea0 105a4e90 10507548 105c3180
> =C2=A0r12-15 =C2=A0ef821430 00000001 ef844090 1053e840
> =C2=A0r16-19 =C2=A0104eae98 105c3180 10541bc0 0000000e
> =C2=A0r20-23 =C2=A000000002 104eb0e8 0000001e 00000001
> =C2=A0r24-27 =C2=A000000000 101004d8 00000001 104eae90
> =C2=A0r28-31 =C2=A0ef824000 00000000 ef8242c0 00000001
> =C2=A0sr00-03 =C2=A000000000 00000000 00000000 00000000
> =C2=A0sr04-07 =C2=A000000000 00000000 00000000 00000000
>
> =C2=A0IASQ: 00000000 00000000 IAOQ: 10164138 1016413c
> =C2=A0IIR: 03ffe01f =C2=A0 =C2=A0ISR: 1024037e =C2=A0IOR: 09024264
> =C2=A0CPU: =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 CR30: ef824000 CR31: 4=
0002008
> =C2=A0ORIG_R28: 00000001
> =C2=A0IAOQ[0]: smp_call_function_single+0xa0/0x154
> =C2=A0IAOQ[1]: smp_call_function_single+0xa4/0x154
> =C2=A0RP(r2): smp_call_function+0x28/0x38
> =C2=A0Backtrace:
> =C2=A0[<101644f4>] smp_call_function+0x28/0x38
> =C2=A0[<1016a6e0>] __irq_set_trigger+0xa4/0xdc
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
> =C2=A0[<101642a8>] smp_call_function_many+0xbc/0x2e0
>
> =C2=A0224k freed
>
>
> Kernel continues working after that.
>

Could you please comment?
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
