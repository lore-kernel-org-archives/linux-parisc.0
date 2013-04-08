From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Mon, 8 Apr 2013 11:20:07 +0200
Message-ID: <CAKgNAkhv6tovvnucoofDR-eOe4H7xeFZDam9+iaVVndEqbuoXg@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com>
 <20130407135514.GW12938@bombadil.infradead.org> <201304071439.15297.vapier@gentoo.org>
 <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org>,
	linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>,
	"James E.J. Bottomley" <jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org>,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>,
	Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLU0-SMTP986B123D17DB8B88214F797C40-MsuGFMq8XAE@public.gmane.org>
List-ID: <linux-man.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 7, 2013 at 8:48 PM, John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org=
> wrote:
> On 7-Apr-13, at 2:39 PM, Mike Frysinger wrote:
>
>> just to be clear, the only insn you need is:
>>         ble 0x100(%sr2, %r0);
>>
>> the kernel docs say sr2 holds the kernel gateway page (so i guess 0x=
100 is
>> a
>> known offset into that).  the docs don't mention r0 that i can see, =
so i'm
>> guessing it's one of those "always 0" registers ?
>
>
> Yes.  There is also an entry at offset 0xb0 for light-weight-syscalls=
=2E
> Currently,
> this implements an atomic CAS operation used for pthread support.

Mike (and Kyle),

=46or review, here are the tables as they now stand:

=3D=3D=3D=3D=3D
   Architecture calling conventions
       Every architecture has its own way of invoking and passing argum=
ents to
       the kernel.  The details for various architectures are  listed  =
in  the
       two tables below.

       The  first  table  lists  the  instruction used to transition to=
 kernel
       mode, (which might not be the fastest or best way to transition =
to  the
       kernel,  so  you might have to refer to the VDSO), the register =
used to
       indicate the system call number, and the register used  to  retu=
rn  the
       system call result.

       arch/ABI   instruction          syscall #   retval  Notes
       =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
       arm/OABI   swi NR               -           a1      NR is syscal=
l #
       arm/EABI   swi 0x0              r7          r1
       blackfin   excpt 0x0            P0          R0
       i386       int $0x80            eax         eax
       ia64       break 0x100000       r15         r10/r8C
       parisc     ble 0x100(%sr2, %r0) r20         r28
       sparc/32   t 0x10               g1          o0
       sparc/64   t 0x6d               g1          o0
       x86_64     syscall              rax         rax

       The second table shows the registers used to pass the system cal=
l argu=E2=80=90
       ments.

       arch/ABI   arg1   arg2   arg3   arg4   arg5   arg6   arg7
       =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80
       arm/OABI   a1     a2     a3     a4     v1     v2     v3
       arm/EABI   r1     r2     r3     r4     r5     r6     r7
       blackfin   R0     R1     R2     R3     R4     R5     -
       i386       ebx    ecx    edx    esi    edi    ebp    -
       ia64       r11    r9     r10    r14    r15    r13    -
       parisc     r26    r25    r24    r23    r22    r21    -
       sparc/32   o0     o1     o2     o3     o4     o5     -
       sparc/64   o0     o1     o2     o3     o4     o5     -
       x86_64     rdi    rsi    rdx    r10    r8     r9     -

       Note that these tables don't cover the entire  calling  conventi=
on=E2=80=94some
       architectures  may  indiscriminately clobber other registers not=
 listed
       here.
=3D=3D=3D=3D=3D

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
