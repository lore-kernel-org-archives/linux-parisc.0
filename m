From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: can't compile kernel for parisc
Date: Fri, 3 Apr 2009 17:57:38 +0400
Message-ID: <a4423d670904030657r4ba8b472x285d8dc2ded160f8@mail.gmail.com>
References: <a4423d670903180455u20ead146k919426a1fb7276c6@mail.gmail.com>
	 <20090318140026.7F06C4FA9@hiauly1.hia.nrc.ca>
	 <20090402155504.GD14159@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090402155504.GD14159@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/4/2 Kyle McMartin <kyle@mcmartin.ca>:
> On Wed, Mar 18, 2009 at 10:00:26AM -0400, John David Anglin wrote:
>> > ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot reach
>> > 000000b2_b2:46+4068, recompile with -ffunction-sections
>> > ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot handle
>> > R_PARISC_PCREL12F for .text
>> >
>>
>> -ffunction-sections won't work because GCC doesn't generate calls
>> with instructions that would use a R_PARISC_PCREL12F relocation.
>> This is some kind of conditional branch. =C2=A0Probably, it's in som=
e
>> kernel assembly code.
>>
>> You need to use nm, objdump and/or readelf to determine which file
>> contributing to built-in.o contains the branch. =C2=A0I looked in on=
e of
>> my builds and didn't see this relocation.
>>
>
> This is... somewhat special. I've never seen this either. Possibly I
> should install a Gentoo machine so I can reproduce with their toolcha=
in?
>
> objdump -dr arch/parisc/kernel/built-in.o | grep PCREL12F should tell
> you where the problem is. I agree with JDA, judging by the fact that
> it's the kernel/built-in.o, I would guess it's assembler as well.
Thanks.
now I have

ld: drivers/built-in.o(.devinit.text+0x3f520): cannot reach
00002ea1_memcpy+0, recompile with -ffunction-sections
ld: drivers/built-in.o(.devinit.text+0x3f520): cannot handle
R_PARISC_PCREL17F for memcpy


0003f044 <niu_get_invariants>:
<..>
0003f0ac <.L1724>:
<..>
3f510:       40 bc 01 b0     ldb d8(r5),ret0
3f514:       37 9c 00 02     ldo 1(ret0),ret0
3f518:       60 bc 01 b0     stb ret0,d8(r5)
3f51c:       40 b8 01 e8     ldb f4(r5),r24
3f520:       e8 40 00 00     b,l 3f528 <.L1724+0x47c>,rp
                   3f520: R_PARISC_PCREL17F        memcpy
3f524:       34 ba 02 88     ldo 144(r5),r26
3f528:       e8 5f 04 25     b,l 3e740 <niu_get_and_validate_port>,rp
3f52c:       08 12 02 5a     copy r18,r26
3f530:       c8 7c ae c4     movb,<> ret0,r3,40c98 <.L1884+0x5c>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
