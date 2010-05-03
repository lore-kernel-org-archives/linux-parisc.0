From: Helge Deller <deller@gmx.de>
Subject: Re: SIGFPE trapping on HPPA
Date: Mon, 03 May 2010 22:44:21 +0200
Message-ID: <4BDF35A5.5010309@gmx.de>
References: <A087547A-1917-414F-90E6-D7DB11646174@free.fr> <F7561409-C8B6-4557-8346-7CF6B123863E@free.fr> <119aab440912140706o7aaa9bf6q1c53568e00ea6291@mail.gmail.com> <658D8AB1-4B32-4862-9938-503E3AC45FD9@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org, 559406@bugs.debian.org
To: Thibaut Paumard <mlotpot.news@free.fr>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <658D8AB1-4B32-4862-9938-503E3AC45FD9@free.fr>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/14/2009 11:08 PM, Thibaut Paumard wrote:
> Le 14 d=E9c. 09 =E0 16:06, Carlos O'Donell a =E9crit :
> Attached is a rather small testcase.
>=20
> Compile with
>   gcc -lm -o fputest fputest.c
>=20
> Run with
>   ./fputest
> or with any succession of 'i's and 'f's, e.g.
>   ./fputest iffifi
>=20
> The expected behaviour (checked on i386) is that for each f or i lett=
er,
> a line is output, for instance
>      $ ./fputest iffi
>      Triggering integer SIGFPE: 1/0=3D(SIGFPE trapped)0
>      Triggering floating SIGFPE: 1./0.=3D(SIGFPE trapped)0.000000
>      Triggering floating SIGFPE: 1./0.=3D(SIGFPE trapped)0.000000
>      Triggering integer SIGFPE: 1/0=3D(SIGFPE trapped)0
>      $ echo $?
>      0
>=20
> All the SIGFPEs should be trapped and the program should exit gracefu=
lly
> (check $?).
>=20
> Under HPPA, the integer SIGFPEs are trapped but the floating-point
> SIGFPEs are not:
>      $ ./fputest iffi
>      Triggering integer SIGFPE: 1/0=3D(SIGFPE trapped)0
>      Triggering floating SIGFPE: 1./0.=3DFloating point exception
>      $ echo $?
>      136


The problem in this test case is, that a signal handler is called
when SIGFPE happens. Then glibc uses a trampoline handler to call the
signal handler, in which it touches the floating point registers again
and finally gets another SIGFPE. In this case, the program just ends
(since the original signal handler already trapped).
Involved glibc function is _dl_runtime_resolve() at=20
ports/sysdeps/hppa/dl-trampoline.S:73

The solution is simple.
Just clear the exception register in arch/parisc/math-emu/decode_exc.c
in the linux kernel before sending the SIGFPE signal to user space.

Patch attached.

While at this, I think we need to clear the exception registers for
the other cases like OVERFLOWEXCEPTION and INEXACTEXCEPTION at least
as well (see arch/parisc/math-emu/decode_exc.c, line 286 ff).

Helge

Patch:
-------------------------
[PATCH] parisc: clear floating point exception flag on SIGFPE signal

Clear the floating point exception flag before returning to
user space. This is needed, else the libc trampoline handler
may hit the same SIGFPE again while building up a trampoline
to a signal handler.

=46ixes debian bug #559406.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/math-emu/decode_exc.c b/arch/parisc/math-emu/d=
ecode_exc.c
index 3ca1c61..27a7492 100644
--- a/arch/parisc/math-emu/decode_exc.c
+++ b/arch/parisc/math-emu/decode_exc.c
@@ -342,6 +342,7 @@ decode_fpu(unsigned int Fpu_register[], unsigned in=
t trap_counts[])
 		return SIGNALCODE(SIGFPE, FPE_FLTINV);
 	  case DIVISIONBYZEROEXCEPTION:
 		update_trap_counts(Fpu_register, aflags, bflags, trap_counts);
+		Clear_excp_register(exception_index);
 	  	return SIGNALCODE(SIGFPE, FPE_FLTDIV);
 	  case INEXACTEXCEPTION:
 		update_trap_counts(Fpu_register, aflags, bflags, trap_counts);
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
