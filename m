From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.36 regression : swap support broken
Date: Mon, 13 Dec 2010 07:52:02 -0500
Message-ID: <AANLkTi=5zJeqGSp7QpscVN6k8D-d2NhknzGJmxd8mWcZ@mail.gmail.com>
References: <20101212235557.7E7244E33@hiauly1.hia.nrc.ca>
	<20101213000303.EAF4D4CF3@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, gmsoft@tuxicoman.be,
	linux-parisc@vger.kernel.org, eike-kernel@sf-tec.de
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101213000303.EAF4D4CF3@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Dec 12, 2010 at 7:03 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> > (insn:TI 15 14 16 (parallel [
>> > =A0 =A0 =A0 =A0 =A0 =A0 (asm_operands/v ("") ("") 0 []
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0[]
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0[] mm/swap_state.c:185)
>> > =A0 =A0 =A0 =A0 (clobber (mem:BLK (scratch) [0 A8]))
>> > =A0 =A0 ]) include/linux/page-flags.h:298 -1
>> > =A0 =A0 (nil))
>>
>> I think the way to avoid this in the kernel is to stick a "nop" in
>> the memory barrier. =A0That will avoid a zero length asm and branchi=
ng
>> into the delay slot.
>
> A further reason is GCC does not know the length of asm insns. =A0So,
> using a zero length asm on parisc is asking for trouble.

The problem is that many applications (including glibc IIRC) expect a
zero length asm volatile to work correctly. Althought it's asking for
trouble, I think it's one of these expected things that just has to
work :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
