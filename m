From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.36 regression : swap support broken
Date: Mon, 13 Dec 2010 09:47:22 -0500
Message-ID: <AANLkTi=Ebv-afncbi4DV2zxTNi1qQiwFjk2e4LL=KvoM@mail.gmail.com>
References: <AANLkTi=5zJeqGSp7QpscVN6k8D-d2NhknzGJmxd8mWcZ@mail.gmail.com>
	<20101213130646.14CD44E2A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, gmsoft@tuxicoman.be,
	linux-parisc@vger.kernel.org, eike-kernel@sf-tec.de
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101213130646.14CD44E2A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 13, 2010 at 8:06 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> >> I think the way to avoid this in the kernel is to stick a "nop" i=
n
>> >> the memory barrier. =3DA0That will avoid a zero length asm and br=
anching
>> >> into the delay slot.
>
> This adds about 17000 odd nops ;(
>
>> > A further reason is GCC does not know the length of asm insns. =3D=
A0So,
>> > using a zero length asm on parisc is asking for trouble.
>>
>> The problem is that many applications (including glibc IIRC) expect =
a
>> zero length asm volatile to work correctly. Althought it's asking fo=
r
>> trouble, I think it's one of these expected things that just has to
>> work :-)
>
> Most targets don't have to deal with delay branch sequences and the
> fact that the hardware can't deal with a branch to the delay slot.
>
> As I have learned this morning, the length calculated for asms is jus=
t
> an estimate. =A0It can be confused by comments, etc. =A0So, gcc is go=
ing to
> have to add a nop when it finds an asm after a branch because the siz=
e
> estimate is unreliable.
>
> I had tried to fix this before but missed the asm_operands case. =A0T=
he
> branch type selection (useskip) also needs to check for asms ;(

=46or the record I have noticed at least 3 failures in branch delay
slots over the past few years, all fixed by -fno-dbr (sp?), so it's
quite possible these were the same problem?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
