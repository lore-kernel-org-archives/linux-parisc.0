From: Bernd Gietzelt <berndg@fsim-ev.de>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 10 Aug 2009 10:26:35 +0200
Message-ID: <20090810102635.5c375177.berndg@fsim-ev.de>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
	<4A724818.4080909@tausq.org>
	<Pine.SOC.4.64.0907310923520.710@math.ut.ee>
	<20090805174507.GB11458@lackof.org>
	<Pine.SOC.4.64.0908052241550.4076@math.ut.ee>
	<20090806141542.bf48febf.berndg@fsim-ev.de>
	<20090807162242.GA18373@lackof.org>
	<20090808113100.37e0f4ab.berndg@fsim-ev.de>
	<20090809052714.GA22362@lackof.org>
	<4A7F7652.6050209@tausq.org>
	<7d01f9f00908100101w3d73e91fmce80eb79e85bdc61@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Randolph Chung <randolph@tausq.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00908100101w3d73e91fmce80eb79e85bdc61@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 10 Aug 2009 10:01:32 +0200
Thibaut VARENE <T-Bone@parisc-linux.org> wrote:

> On Mon, Aug 10, 2009 at 3:22 AM, Randolph Chung<randolph@tausq.org>
> wrote:
> >>
> >>> [ =A0 =A07.988000] Freeing unused kernel memory: <0>------------[=
 cut
> >>> here ]------------
> >>> [ =A0 =A08.096000] Badness at
> >>> /build/buildd/linux-2.6-2.6.30/debian/build/source_hppa_none/kern=
el/smp.c:369
> >>> [ =A0 =A08.104000] [ =A0 =A08.104000]
> >>> =A0YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI [ =A0 =A08.108000] PSW:
> >>> 00001000000001100000000000001110 Not tainted [ =A0 =A08.116000]
> >>> r00-03 =A0000000000806000e 0000000040686fa0 0000000040182c6c
> >>> 000000004058d020 [ =A0 =A08.120000] r04-07 =A00000000040668fa0
> >>> 000000004065e7c0 00000000404f7db0 000000r08-11 =A00000000040686fa=
0
> >>> 000000004065e7c0 0000000000000000 00000000406797a0
> >>> [ =A0 =A08.644000] r12-15 =A00000000000000001 0000000000000001
> >>> 0000000000000000 0000000000000001
> >>> [ =A0 =A08.776000] r16-19 =A000000000f00003b0 0000000040686fa0
> >>> 000000012f87cb40 00000000406d6000
> >>> [ =A0 =A08.784000] r20-23 =A00000000000000000 00000000406d6000
> >>> ffffffffffffffff 0000000000000001
> >>> [ =A0 =A08.788000] r24-27 =A00000000000000000 000000004065e7c0
> >>> 00000000404f7db0 0000000040668fa0
> >>> [ =A0 =A08.796000] r28-31 =A00000000000000000 000000012f880490
> >>> 000000012f880580 0000000000000000
> >>> [ =A0 =A08sr00-03 =A00000000000000000 0000000000000000 0000000000=
000000
> >>> 0000000000000000
> >>> [ =A0 =A09.208000] sr04-07 =A00000000000000000 0000000000000000
> >>> 0000000000000000 0000000000000000
> >>> [ =A0 =A09.340000] [ =A0 =A09.340000] IASQ: 0000000000000000
> >>> 0000000000000000 IAOQ: 00000000401829b4 00000000401829b8
> >>> [ =A0 =A09.348000] =A0IIR: 03ffe01f =A0 =A0ISR: 0000000010240000 =
=A0IOR:
> >>> 0000000179de7d0c
> >>> [ =A0 =A09.356000] =A0CPU: =A0 =A0 =A0 =A00 =A0 CR30: 000000012f8=
80000 CR31:
> >>> 0000000000008020
> >>> [ =A0 =A09.360000] =A0ORIG_R28: 000000000800000e
> >>> [ =A0 =A09.364000] =A0mp_call_function_many+0x7c/0x2f8
> >>> [ =A0 =A09.768000] =A0IAOQ[1]: smp_call_function_many+0x80/0x2f8
> >>> [ =A0 =A09.796000] =A0RP(r2): smp_call_function+0x3c/0x50
> >>> [ =A0 =A09.800000] Backtrace:
> >>> [ =A0 =A09.804000] Backtrace:
> >>> [ =A0 =A09.804000] =A0[<0000000040115fe8>] printk+0x40/0x50
> >>> [ =A0 =A09.804000] =A0[<0000000040152760>] print_tainted+0xc0/0xe=
0
> >>> [ =A0 =A09.804000] =A0[<0000000040104084>] intr_check_sig+0x0/0x3=
8
> >>> [ =A0 =A09.804000] =A0[<0000000040104074>] intr_return+0x0/0x4
> >>> [ =A0 =A09.804000] =A0[<0000000040182c6c>] smp_call_function+0x3c=
/0x50
> >>> [ =A0 =A09.804000] =A0[<0000000040159d08>] on_each_cpu+0x28/0x68
> >>> [ =A0 =A09.804000] =A0[<000000004011b92c>] free_initmem+0x94/0x34=
0
> >
> > Is there another error message further on?=20

No. Nothing. After that point the system give no further messages.
Someone noted it looks like a deadlock.

> For the sake of reliability I've put a (temporary) static copy of the

Thank you for that.

> FWIW, the above dump is not the final message, from what can be seen
> of the other dumps. As a matter of fact, it happens way before the
> actual crash, which is triggered by loading drivers (SYM, afaict).
> Output is garbled by GSP, and it seems to me that the dump with
> pdcchassis=3D0 is truncated. Could the author post a full dump of the
> boot log with pdcchassis=3D0 please? (and maybe use pastebin? ;-)

http://www.pateam.org/archive/tmp/serrparitylogs.html#kernel_2.6.30-1-p=
arisc64-smp
is a full dump of the boot log.

I've blacklisted the tulip kernel module but this doesn't change the
behavior. I'll try a custom kernel without all these driver.

cheers,
bernd

--=20
Bernd Gietzelt <berndg@fsim-ev.de>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
