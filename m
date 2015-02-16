From: =?UTF-8?B?4oGjIOKBow==?= <lausgans@gmail.com>
Subject: Re: Little endianness
Date: Mon, 16 Feb 2015 14:26:23 +0400
Message-ID: <CANoehN9jw8BgsTNZgbJZpkpWPXKLwhCqbaTjj-e5w+8DJEPGWg@mail.gmail.com>
References: <loom.20150210T112204-76@post.gmane.org>
	<BLU436-SMTP173A5545802614E9A03A58A97240@phx.gbl>
	<1423583801.2167.17.camel@HansenPartnership.com>
	<4CB18756-188A-47DF-9E31-10EAFE3C558D@gmail.com>
	<1424019008.2114.10.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1424019008.2114.10.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2015-02-15 19:50 GMT+00:00 James Bottomley
<James.Bottomley@hansenpartnership.com>:
> On Sun, 2015-02-15 at 09:49 +0300, lausgans@gmail.com wrote:
>> > James Bottomley <James.Bottomley@HansenPartnership.com>:
>> >
>> > On Tue, 2015-02-10 at 10:30 -0500, John David Anglin wrote:
>> >> On 2015-02-10 5:31 AM, Held Bier wrote:
>> >>> Hi.
>> >>>
>> >>> Looks like PA-RISC 1.1 added bi-endian support.
>> >>> What about PA-RISC Linux? I know it's big endian.
>> >>> But does it possible to build little endian kernel? If so, how?
>> >>> Is migration to little endian planned? It should be reasonable
>> >>> as it will bring more  compatibility with other Linux world.
>> >
>> > What compatibility?  x86 is LE, Arm is Schizophrenic, PPC, Sparc a=
nd PA
>> > are BE.  We're required to support the bus standards anyway, so th=
e SCSI
>> > bus is BE and the PCI bus LE by spec.  There's no such thing as a
>> > "compatible" endianness.
>>
>> Some software authors still assume that we're living in x86 only
>> world, or just don't care. This leads to issues when one wish to run
>> such software on a BE Linux.
>>
>> POWER is moving to LE:
>> https://www.ibm.com/developerworks/community/blogs/fe313521-2e95-46f=
2-817d-44a4f27eba32/entry/just_the_faqs_about_little_endian
>> "Although Power already has Linux distributions and supporting
>> applications that run in big endian mode, the Linux application
>> ecosystem for x86 platforms is much larger and Linux on x86 uses
>> little endian mode.  Numerous clients, software partners, and IBM=E2=
=80=99s
>> own software developers have told us that porting their software to
>> Power becomes simpler if the Linux environment on Power supports
>> little endian mode, more closely matching the environment provided b=
y
>> Linux on x86.  This new level of support will lower the barrier to
>> entry for porting Linux on x86 software to Linux on Power."
>>
>> For PPC the patch was made: http://lwn.net/Articles/408845/
>
> That's not a correct inference from the facts.  Power is interested i=
n
> playing in the embedded space and some of the graphics SoCs available
> there are LE only, so they're interested in enabling a LE version to =
run
> in that space ... it won't affect the rest of the PPC boxes.
>
> All our boxes either have no graphics or a HP special big endian card=
=2E
> The only exception is the C8000 which has an ATI with special firmwar=
e
> (also designed for BE).
>
> The thing you don't seem to understand is that the endianness is
> actually fixed by the firmware of the shipping systems.  You're tied =
to
> whatever the firmware starts you in because swapping after the firmwa=
re
> init is unbelievably painful, especially when you need to call the
> firmware to perform OS tasks.  We don't have any new systems planned,=
 so
> all the firmware is now fixed for PA and the endianness with it.
>
> James

James,

This was a general question. In case if you're connecting dots with my
later topic "Video option for a big endian machine?" - I should rather
name it "... for a non-x86 arch", as there may be more platform
specific issues, than just byte order. By the links i've provided
there are thoughts that some graphics driver / stack (as well as many
other non-related programs) may still be not fixed, e.g. they may
don't use the host byte order at the CPU side operations, and so don't
work. Of course the proper solution is to fix the actual code, but
having a LE OS option for that hardware platform should be also an
ultimate so-so solution.
Sorry for my question then, that was just a curiosity, I'm in no event
asking anyone to sacrifice their forces and time just to bring LE to
PA Linux.

> The only exception is the C8000 which has an ATI with special firmwar=
e
> (also designed for BE).

This doesn't seem to be true:
- Once I've put ATI designed for (and working in, under HP-UX) C8000
into IA64 machine with LE Linux and it worked fine;
- If HP asked ATI to produce a custom firmware, what's the purpose of
putting x86 emulator into PDC? Actually both IA64 and PA-RISC ZX1
machines can POST most of relatively modern cards with unmodified
VBIOS.

To add, Nvidia cards fail similarly to ATI with ring buffer issue (GPU
locks up). If it's not the Nouveau breakage, than some PA Linux code
(possibly DMA related) does something wrong.

> The thing you don't seem to understand is that the endianness is
> actually fixed by the firmware of the shipping systems.  You're tied =
to
> whatever the firmware starts you in because swapping after the firmwa=
re
> init is unbelievably painful, especially when you need to call the
> firmware to perform OS tasks.

I'm sure you're right, i'm not expert there. I'm wondering why IA64
(or mentioned POWER) doesn't suffer from such obstacles?
https://forums.gentoo.org/viewtopic-p-2432985.html?sid=3D890fd4a4113673=
0c64d573192c9e3b57#2432985
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
