From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 10 Aug 2009 10:09:36 +0200
Message-ID: <7d01f9f00908100109y6265c3efs31a6a2c46679ae90@mail.gmail.com>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
	 <Pine.SOC.4.64.0907310923520.710@math.ut.ee>
	 <20090805174507.GB11458@lackof.org>
	 <Pine.SOC.4.64.0908052241550.4076@math.ut.ee>
	 <20090806141542.bf48febf.berndg@fsim-ev.de>
	 <20090807162242.GA18373@lackof.org>
	 <20090808113100.37e0f4ab.berndg@fsim-ev.de>
	 <20090809052714.GA22362@lackof.org> <4A7F7652.6050209@tausq.org>
	 <7d01f9f00908100101w3d73e91fmce80eb79e85bdc61@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Bernd Gietzelt <berndg@fsim-ev.de>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00908100101w3d73e91fmce80eb79e85bdc61@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 10, 2009 at 10:01 AM, Thibaut VARENE<T-Bone@parisc-linux.or=
g> wrote:
> On Mon, Aug 10, 2009 at 3:22 AM, Randolph Chung<randolph@tausq.org> w=
rote:
>>>
>>>> [ =C2=A0 =C2=A07.988000] Freeing unused kernel memory: <0>--------=
----[ cut here
>>>> ]------------
>>>> [ =C2=A0 =C2=A08.096000] Badness at
>>>> /build/buildd/linux-2.6-2.6.30/debian/build/source_hppa_none/kerne=
l/smp.c:369
>>>> [ =C2=A0 =C2=A08.104000] [ =C2=A0 =C2=A08.104000] =C2=A0 =C2=A0 =C2=
=A0YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>>> [ =C2=A0 =C2=A08.108000] PSW: 00001000000001100000000000001110 Not=
 tainted
>>>> [ =C2=A0 =C2=A08.116000] r00-03 =C2=A0000000000806000e 00000000406=
86fa0 0000000040182c6c
>>>> 000000004058d020
>>>> [ =C2=A0 =C2=A08.120000] r04-07 =C2=A00000000040668fa0 00000000406=
5e7c0 00000000404f7db0
>>>> 000000r08-11 =C2=A00000000040686fa0 000000004065e7c0 0000000000000=
000
>>>> 00000000406797a0
>>>> [ =C2=A0 =C2=A08.644000] r12-15 =C2=A00000000000000001 00000000000=
00001 0000000000000000
>>>> 0000000000000001
>>>> [ =C2=A0 =C2=A08.776000] r16-19 =C2=A000000000f00003b0 00000000406=
86fa0 000000012f87cb40
>>>> 00000000406d6000
>>>> [ =C2=A0 =C2=A08.784000] r20-23 =C2=A00000000000000000 00000000406=
d6000 ffffffffffffffff
>>>> 0000000000000001
>>>> [ =C2=A0 =C2=A08.788000] r24-27 =C2=A00000000000000000 00000000406=
5e7c0 00000000404f7db0
>>>> 0000000040668fa0
>>>> [ =C2=A0 =C2=A08.796000] r28-31 =C2=A00000000000000000 000000012f8=
80490 000000012f880580
>>>> 0000000000000000
>>>> [ =C2=A0 =C2=A08sr00-03 =C2=A00000000000000000 0000000000000000 00=
00000000000000
>>>> 0000000000000000
>>>> [ =C2=A0 =C2=A09.208000] sr04-07 =C2=A00000000000000000 0000000000=
000000
>>>> 0000000000000000 0000000000000000
>>>> [ =C2=A0 =C2=A09.340000] [ =C2=A0 =C2=A09.340000] IASQ: 0000000000=
000000 0000000000000000
>>>> IAOQ: 00000000401829b4 00000000401829b8
>>>> [ =C2=A0 =C2=A09.348000] =C2=A0IIR: 03ffe01f =C2=A0 =C2=A0ISR: 000=
0000010240000 =C2=A0IOR:
>>>> 0000000179de7d0c
>>>> [ =C2=A0 =C2=A09.356000] =C2=A0CPU: =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A0 CR30: 000000012f880000 CR31:
>>>> 0000000000008020
>>>> [ =C2=A0 =C2=A09.360000] =C2=A0ORIG_R28: 000000000800000e
>>>> [ =C2=A0 =C2=A09.364000] =C2=A0mp_call_function_many+0x7c/0x2f8
>>>> [ =C2=A0 =C2=A09.768000] =C2=A0IAOQ[1]: smp_call_function_many+0x8=
0/0x2f8
>>>> [ =C2=A0 =C2=A09.796000] =C2=A0RP(r2): smp_call_function+0x3c/0x50
>>>> [ =C2=A0 =C2=A09.800000] Backtrace:
>>>> [ =C2=A0 =C2=A09.804000] Backtrace:
>>>> [ =C2=A0 =C2=A09.804000] =C2=A0[<0000000040115fe8>] printk+0x40/0x=
50
>>>> [ =C2=A0 =C2=A09.804000] =C2=A0[<0000000040152760>] print_tainted+=
0xc0/0xe0
>>>> [ =C2=A0 =C2=A09.804000] =C2=A0[<0000000040104084>] intr_check_sig=
+0x0/0x38
>>>> [ =C2=A0 =C2=A09.804000] =C2=A0[<0000000040104074>] intr_return+0x=
0/0x4
>>>> [ =C2=A0 =C2=A09.804000] =C2=A0[<0000000040182c6c>] smp_call_funct=
ion+0x3c/0x50
>>>> [ =C2=A0 =C2=A09.804000] =C2=A0[<0000000040159d08>] on_each_cpu+0x=
28/0x68
>>>> [ =C2=A0 =C2=A09.804000] =C2=A0[<000000004011b92c>] free_initmem+0=
x94/0x340
>>>>
>
>> As others have pointed out this smp dump appears to be "harmless" an=
d may
>> not be the real culprit of the problems you are seeing.
>>
>> Is there another error message further on? Your URL doesn't work for=
 me
>> either.
>
> For the sake of reliability I've put a (temporary) static copy of the=
 page here:
> http://www.pateam.org/archive/tmp/serrparitylogs.html
> It still links to the original URL for CSS and stuff, but at least th=
e
> logs are there.
>
> FWIW, the above dump is not the final message, from what can be seen
> of the other dumps. As a matter of fact, it happens way before the
> actual crash, which is triggered by loading drivers (SYM, afaict).
> Output is garbled by GSP, and it seems to me that the dump with
> pdcchassis=3D0 is truncated. Could the author post a full dump of the
> boot log with pdcchassis=3D0 please? (and maybe use pastebin? ;-)

Bummer, I've been reading the logs a bit too quickly. It seems we have
two different problems here:

2.6.30-1-64smp doesn't boot (apparently doesn't load init, hangs after
the badness in smp.c message)
2.6.30-1-64up crashes while loading PCI drivers

A log of the up kernel with pdcchassis=3D0 would thus be helpful.

HTH

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
