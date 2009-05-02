From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: Kernel Panic during init with 2.6.29-gb609308 (fresh clone of git
	master)
Date: Sat, 2 May 2009 22:41:11 +0200
Message-ID: <7d01f9f00905021341h796fc3aan92693c3850055be8@mail.gmail.com>
References: <7d01f9f00905021204n5582bcfbm93cf449744742c66@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00905021204n5582bcfbm93cf449744742c66@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

=46or the sake of making this half less useless, it happened with a
64bit kernel (A500). ;^P

On Sat, May 2, 2009 at 9:04 PM, Thibaut VARENE <T-Bone@parisc-linux.org=
> wrote:
> Fresh clone of kyle's parisc-2.6 master branch from kernel.org.
>
> Not much to say, it went AWOL during init while starting snmpd...
>
> I dunno if that's worth debugging tho, seems like everybody is using
> 2.6.30 already (I must have misunderstood how to use git again :P)
>
> HTH
>
> Linux version 2.6.29-gb609308 (varenet@mkhppa3) (gcc version 4.2.4
> (Debian 4.2.4-6)) #1 SMP Sat May 2 20:39:12 CEST 2009
>
>
>
> Starting Name Service Cache Daemon: nscd.
> Starting internet superserver: inetd.
> Starting network management services:Backtrace:
>
>
> Kernel Fault: Code=3D15 regs=3D000000012eb44a50 (Addr=3D000000002e924=
ca0)
>
> =C2=A0 =C2=A0 YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001111111100001111 Not tainted
> r00-03 =C2=A0000000ff0804ff0f 0000000040708120 000000006fc00000 00000=
0012eb44838
> r04-07 =C2=A000000000ffffe000 0000000000000010 000000006bc23fd9 00000=
00000000014
> r08-11 =C2=A000000000000001a0 0000000073c00008 0000000000000010 00000=
0004064f478
> r12-15 =C2=A00000000000000000 0000000000000000 0000000000000000 00000=
00000000001
> r16-19 =C2=A0000000012f8ba100 0000000000000000 00000000fb5fd5d4 00000=
00040126388
> r20-23 =C2=A0ffffffffffffff30 00000000401203c0 00000000ffffff30 00000=
00000000000
> r24-27 =C2=A000000000405a9364 0000000037de0000 0000000040120993 00000=
000406fa120
> r28-31 =C2=A0000000002e924ca0 00000000401202d0 000000012eb44a50 00000=
0002e924cb0
> sr00-03 =C2=A00000000000259800 0000000000000000 0000000000000000 0000=
000000259800
> sr04-07 =C2=A00000000000000000 0000000000000000 0000000000000000 0000=
000000000000
>
> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004012fe4c 000000=
004012fe50
>
> Press Q/q to quit, Enter to continue:
>
> =C2=A0IIR: 0f8010df =C2=A0 =C2=A0ISR: 0000000000000000 =C2=A0IOR: 000=
000002e924ca0
> =C2=A0CPU: =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 CR30: 000000012eb44000=
 CR31: 000000004065c000
> =C2=A0ORIG_R28: 000000004019df7c
> =C2=A0IAOQ[0]: unwind_once+0x354/0x490
> =C2=A0IAOQ[1]: unwind_once+0x358/0x490
> =C2=A0RP(r2): 0x6fc00000
> Backtrace:
>
> Kernel panic - not syncing: Kernel Fault
> Backtrace:
>
>
>
> --
> Thibaut VARENE
> http://www.parisc-linux.org/~varenet/
>



--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
