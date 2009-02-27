From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: can't compile kernel for parisc
Date: Fri, 27 Feb 2009 18:40:46 +0300
Message-ID: <a4423d670902270740y2c376722j2c2b444401bdc271@mail.gmail.com>
References: <a4423d670902270247g70134a05n20fe3ba7c8970fbe@mail.gmail.com>
	 <119aab440902270424oaafbc7ehcc23b433e8ae06e5@mail.gmail.com>
	 <a4423d670902270504w6386cffdp91249e962dfa3fa4@mail.gmail.com>
	 <119aab440902270518t2cc34c13x4991fb394d54f774@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440902270518t2cc34c13x4991fb394d54f774@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/2/27 Carlos O'Donell <carlos@systemhalted.org>:
> On Fri, Feb 27, 2009 at 8:04 AM, Alexander Beregalov
> <a.beregalov@gmail.com> wrote:
>> 2009/2/27 Carlos O'Donell <carlos@systemhalted.org>:
>>> On Fri, Feb 27, 2009 at 5:47 AM, Alexander Beregalov
>>> <a.beregalov@gmail.com> wrote:
>>>> I am building the kernel for parisc for the first time.
>>>> Have I missed anything important?
>>>
>>> Where did you get your kernel source? e.g. I cloned foo, merged bar
>>> into, foo and then compiled.
>>
>> I cloned current Linus's git tree.
>
> I always merge from Kyle's tree (parisc maintainer), which has the
> latest parisc patches. There are at least 26 patches in kyle's tree
> which are not on Linus' git tree.
>
> e.g.
> git remote -v
> kyle =C2=A0 =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/kyle/=
parisc-2.6.git
> origin =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux-2.6.git

Thanks.

The same problem: ld segfaults:

do_page_fault() pid=3D15739 command=3D'ld' type=3D15 address=3D0x00000c=
84

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  0006ff0f ffffffff 407d542b fb6b2640
r04-07  408e3f6c fb6afa37 fb6afa48 00000c84
r08-11  fb6b2aa3 00000000 fb6b0520 00000000
r12-15  00000025 fb6afa0c 00068958 00000042
r16-19  4048e518 00000010 fb6af9cc 408e3f6c
r20-23  80808000 80808080 fefefeff 81010100
r24-27  fb6b25d0 fb6afa47 00000c84 000675c0
r28-31  feff0000 00000073 fb6b2c00 00000c84
sr00-03  00002e25 00000000 00000000 00002e25
sr04-07  00002e25 00002e25 00002e25 00002e25

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
=46PSR: 00000000000000000000000000000000
=46PER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
fr04-07  00000020ef80068c eec228401016a6e0 1051b81000000000 00000000000=
00000
fr08-11  ffffff9cefc16000 efc11bc000000003 00000000eec22840 00000000fff=
ff000
fr12-15  fb6afa349c4df9fe fb6afa0c10128010 fb6af9d4ac2f99e4 10ba6aa8eaf=
8382a
fr16-19  0004010f10574010 10128010efc241c8 1043a1540000000b 10574267000=
0000f
fr20-23  106002f800000000 0004000e1016aa9c fb6afa4700008000 fb6afa0c000=
00af8
fr24-27  0000000000000000 0000000000000000 00000000812df5e4 896cf5835c4=
6e68e
fr28-31  1aab4042650e89ca eb5bc7cd1016aa38 1aab404200000000 efc24240008=
00480

IASQ: 00002e25 00002e25 IAOQ: 4080f407 4080f40b
 IIR: 0f401094    ISR: 00002e25  IOR: 00000c84
 CPU:        0   CR30: c410c000 CR31: 0185e003
 ORIG_R28: 00000000
 IAOQ[0]: 0x4080f404
 IAOQ[1]: 0x4080f408
 RP(r2): 0x407d5428

The kernel is 2.6.24-gentoo-r3-livecd32 and I do not have System.map fo=
r it.
It seems I need to use another LiveCD for building kernel (in chroot
environment)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
