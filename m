From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date: Sat, 27 Jan 2018 18:42:44 +0100
Message-ID: <2594108.Soefd0VDuM@daneel.sf-tec.de>
References: <11946948.1Lt8Nslq4k@devpool21> <57873f7fe3e5227fcf2f4ed20407f2b6@sf-tec.de> <2a632168-7608-736b-22df-64ca702b34d5@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart68963196.udETrsNKch"; micalg="pgp-"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2a632168-7608-736b-22df-64ca702b34d5@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart68963196.udETrsNKch
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 26. Januar 2018, 23:31:46 schrieb Helge Deller:
> On 25.01.2018 16:36, Rolf Eike Beer wrote:
> > John David Anglin wrote:
> >> On 2018-01-25 3:59 AM, Rolf Eike Beer wrote:
> >>> [  909.756303] Kernel panic - not syncing: Bad Address (null pointer
> >>> deref?) [  909.756303] ---[ end Kernel panic - not syncing: Bad Address
> >>> (null pointer deref?)
> >>> 
> >>> This is actually the second place where it breaks, before that I had the
> >>> same>> 
> >>> with this test (twice):
> >> Would you post the PIM dump of the most recent HPMC in the service
> >> menu?
> > 
> > The service menu does not give any information, as in this older bug:
> > https://bugs.gentoo.org/481768
> FWIW, I've tested the testcase from
>  https://bugs.gentoo.org/481768
> on a debian system:
> Linux panama.osuosl.org 4.14.0-2-parisc64-smp #1 SMP Debian 4.14.7-1
> (2017-12-28) parisc64 GNU/Linux gdb was version 7.12-6+b1
> 
> On debian I can not reproduce the crash.
> 
> With this sequence:
> (gdb) break gdb-crash.c:14
> (gdb) run
> (gdb) set tp = {0,0}
> 
> tp isn't initialized yet before you reach line 25, and as such it points to
> random memory. I you try to set tp, it depends on what happens (but agreed,
> it shouldn't crash the kernel).
> 
> The Debian kernel hasn't any additional hppa-specific patches.

I'm using vanilla, so nothing on my side either.

> >> Also needed
> >> is the assembler dump of the routine where the HPMC occurred in your
> >> kernel.  You need the
> >> 64-bit version of objdump for this.
> 
> I wonder why there isn't any kernel backtrace...

This was with "dmesg -n 8". Without it has shown only the "Bad address" and 
"end Kernel panic" lines, which is IMHO bad by itself.

> Does gentoo uses special compiler-optimization flags?

I have none.

> > I have put the kernel on https://opensource.sf-tec.de/c8000-kernel.tar.xz
> 
> I'd suggest you put some debugging code in your kernel, e.g. in
> compat_ptrace_request() in kernel/ptrace.c.
> I think gdb uses PTRACE_POKEDATA to set some userspace memory of a process.
> It's generic code, so I wonder why it should crash on parisc.
> 
> You may look at compat_arch_ptrace() in arch/parisc/kernel/ptrace.c too, but
> it doesn't touch memory as far as I can see...

I will not be able to touch any of this until at least mid of next week. If 
you want to give it a try, check gdb 7.12.1 testsuite. It was one of the first 
tests that hit this.

Eike
--nextPart68963196.udETrsNKch
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlpsuhoACgkQXKSJPmm5/E6FgACfWxuDW1LIw2xutY5oQYfK2e8c
S5YAn0zMlWvmjPy6svhcGgW7jp9cYZaQ
=Es2b
-----END PGP SIGNATURE-----

--nextPart68963196.udETrsNKch--

