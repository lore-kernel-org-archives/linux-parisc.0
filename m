From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Tue, 1 Feb 2011 17:16:40 -0500
Message-ID: <AANLkTimay4R5Jd9cPyiwy6WizQwcJpC-HR9LmrdZ=bZe@mail.gmail.com>
References: <alpine.SOC.1.00.1102012342200.25944@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1102012342200.25944@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Feb 1, 2011 at 5:00 PM, Meelis Roos <mroos@linux.ee> wrote:
> I have been testing devel kernels on SMP L1000 successfully until
> 2.6.38-rc2-00324-g70d1f36 included. The testing means booting the new
> kernel and running aptitude to update to current debian unstable.
>
> Now I tried 2.6.38-rc3 and got a crash from aptitude on 2 out of 2
> tries. Maybe aptitude was broken inbetween but it looks like a kernel
> bug. Retried 2.6.38-rc2-00324-g70d1f36 and that seemed to work fine s=
o
> it's more likely a kernel problem.
>
> What additional information can I provide?
>
> [ =A0 74.590000]
> [ =A0 74.590000] do_page_fault() pid=3D979 command=3D'aptitude' type=3D=
15 address=3D0x0000002d
> [ =A0 74.590000]
> [ =A0 74.590000] =A0 =A0 =A0YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [ =A0 74.590000] PSW: 00000000000001001111111100001111 Not tainted
> [ =A0 74.590000] r00-03 =A0000000ff0004ff0f 000000004027b5ac 00000000=
405df23b 000000004067e884
> [ =A0 74.590000] r04-07 =A0000000004067c860 000000004067e6d0 00000000=
4067e880 00000000c014b7d0
> [ =A0 74.590000] r08-11 =A00000000000000001 0000000000000001 00000000=
4067c860 0000000041b082c8
> [ =A0 74.590000] r12-15 =A0000000004067e730 000000004067e6d0 00000000=
4067c860 000000004067c860
> [ =A0 74.590000] r16-19 =A0000000004067c860 000000004067e060 00000000=
00000000 000000004067c860
> [ =A0 74.590000] r20-23 =A00000000000000229 0000000000000000 00000000=
00000000 0000000000000000
> [ =A0 74.590000] r24-27 =A0fffffffffffffff5 ffffffffffffffd3 00000000=
4067e730 00000000004227a4
> [ =A0 74.590000] r28-31 =A0000000000000002d 0000000000000000 00000000=
c014b8c0 00000000402688db
> [ =A0 74.590000] sr00-03 =A00000000000228800 0000000000228800 0000000=
000000000 0000000000228800
> [ =A0 74.590000] sr04-07 =A00000000000228800 0000000000228800 0000000=
000228800 0000000000228800
> [ =A0 74.590000]
> [ =A0 74.590000] =A0 =A0 =A0 VZOUICununcqcqcqcqcqcrmunTDVZOUI
> [ =A0 74.590000] FPSR: 00001000001000100010000000000000
> [ =A0 74.590000] FPER1: 00000000
> [ =A0 74.590000] fr00-03 =A00822200000000000 0000000000000000 0000000=
000000000 0000000000000000
> [ =A0 74.590000] fr04-07 =A00000000a00000000 0000000000000000 0000000=
000000000 0000000000000000
> [ =A0 74.590000] fr08-11 =A00000000000000000 00000000406cf120 0000000=
0401563e8 00000000404c59d8
> [ =A0 74.590000] fr12-15 =A0000000000804000f 000000000800000f 0000000=
0401563e8 00000000ffc60460
> [ =A0 74.590000] fr16-19 =A000000000406cf120 0000000040639d54 0000000=
000000046 0000000040599294
> [ =A0 74.590000] fr20-23 =A000000000ffc60348 00000000406dd920 0000000=
000000038 4038000000000000
> [ =A0 74.590000] fr24-27 =A00000000000000000 0000000000000000 3ff0000=
000000000 412e848c00000000
> [ =A0 74.590000] fr28-31 =A00000000040599250 00000000ffc60357 0000000=
0ffc60357 00000000405dfba8
> [ =A0 74.590000]
> [ =A0 74.590000] IASQ: 0000000000228800 0000000000228800 IAOQ: 000000=
00405df25b 00000000405df25f
> [ =A0 74.590000] =A0IIR: 0f80108b =A0 =A0ISR: 0000000000228800 =A0IOR=
: 000000000000002d
> [ =A0 74.590000] =A0CPU: =A0 =A0 =A0 =A00 =A0 CR30: 00000000fe050000 =
CR31: 0000000000008020
> [ =A0 74.590000] =A0ORIG_R28: 0000000000000080
> [ =A0 74.590000] =A0IAOQ[0]: 00000000405df25b
> [ =A0 74.590000] =A0IAOQ[1]: 00000000405df25f
> [ =A0 74.590000] =A0RP(r2): 00000000405df23b

The rp (return pointer) is pointing back into what appears to be a
shared library (always loaded around 0x4???????).

The iir (interrupting instruction register) is instruction "0:   0f 80
10 8b     ldw 0(ret0),r11" (you can do this yourself with "disasm"
from http://cvs.parisc-linux.org/build-tools/disasm?revision=3D1.1&view=
=3Dmarkup).

You can see that ret0 is indeed 0x2d (the address of the fault), and
loading 0x0 + 0x2d will cause a fault and kill your program.

However, the failure probably happened earlier.

As James says, you should try to bisect exactly which commit caused the=
 failure.

Cheers,
CArlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
