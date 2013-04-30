From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Error compiling 3.9.0
Date: Tue, 30 Apr 2013 18:40:17 +0200
Message-ID: <1428267.TfdjUgcdcj@eto>
References: <1742161.3f9jxWykf1@devpool02> <e5606dd2f0529641a897f078e3814e82@sf-mail.de> <517FD922.6060408@bell.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1526605.uEMsf57ztV"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <517FD922.6060408@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1526605.uEMsf57ztV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag 30 April 2013, 10:45:54 schrieb John David Anglin:
> On 4/30/2013 10:02 AM, Rolf Eike Beer wrote:
> > Am 30.04.2013 15:00, schrieb John David Anglin:
> >> On 30-Apr-13, at 5:37 AM, Rolf Eike Beer wrote:
> >>> Compiling for my C8000 (64 bit) failed:
> >>> 
> >>> *arch/parisc/kernel/built-in.o: In function `sys_fork_wrapper':
> >>> *(.text+0x4dc8): relocation truncated to fit: R_PARISC_PCREL17F
> >>> against symbol
> >>> `sys_fork' defined in .text.sys_fork section in kernel/built-in.o
> >>> *hppa64-unknown-linux-gnu-ld: arch/parisc/kernel/built-in.o(.text
> >>> +0xllx):
> >>> cannot reach (null)
> >>> *arch/parisc/kernel/built-in.o: In function `sys_vfork_wrapper':
> >>> *(.text+0x4e1c): relocation truncated to fit: R_PARISC_PCREL17F
> >>> against symbol
> >>> `sys_vfork' defined in .text.sys_vfork section in kernel/built-in.o
> >>> *make: *** [vmlinux] Error 1
> >> 
> >> Some form of a 17-bit branch has been used (e.g., b), to branch to
> >> sys_fork.  Assume
> >> you are building without modules, so you have a big kernel.
> > 
> > I have modules, but I had seen an error before so I tried enabling
> > longcalls. Currently building without MLONGCALLS with new binutils to
> > see if it works then, i.e. the error below goes away.
> 
> Longcalls will not fix the above.  The option doesn't affect assembly code.
> 
> A "b" instruction is not a "call".  By that, I mean that the linker
> doesn't add long call stubs, etc.  It only
> supports a 17-bit pc-relative offset.  The prelinking done by linux can
> result in objects that are too big
> and out of range branches as above.
> 
> >> Problem seems to be here:
> >>         .macro  fork_like name
> >> 
> >> ENTRY(sys_\name\()_wrapper)
> >> 
> >>         LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
> >>         ldo     TASK_REGS(%r1),%r1
> >>         reg_save %r1
> >>         mfctl   %cr27, %r28
> >>         b       sys_\name
> >>         STREG   %r28, PT_CR27(%r1)
> >> 
> >> ENDPROC(sys_\name\()_wrapper)
> >> 
> >>         .endm
> >> 
> >> If %r2 can be clobbered, the "b" instruction could be changed to the
> >> "BL" macro.
> >> This would give 22-bit branch on PA 2.0.  For example,
> >> 
> >> BL    sys_\name, %r2
> 
> Does this work?  I think %r2 should be available but I can't check at
> the moment.

Have not tried yet.

> >>> This is after I enabled MLONGCALLS, witho
> >>> ut longcalls it failed, too. I'm now
> >>> trying with binutils 2.23.1 instead of 2.22.
> >> 
> >> The above is not a binutils bug!
> > 
> > Nope, but probably this:
> > 
> > *hppa64-unknown-linux-gnu-ld: scripts/link-vmlinux.sh: line 52: 5398
> > Segmentation fault      ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2} -T
> > ${lds} ${KBUILD_VMLINUX_INIT} --start-group ${KBUILD_VMLINUX_MAIN}
> > --end-group ${1}
> 
> No, it's probably a kernel bug.  Is the crash consistent?  If it isn't,
> then it's an OS or kernel bug.

I have got the same crash again. This are the first 2 tries I ever made with 
binutils 2.23.1 for 64 bit binaries, so I have nothing to compare to.

Eike
--nextPart1526605.uEMsf57ztV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlF/8/EACgkQXKSJPmm5/E6f1wCgieOGUhASRloH6NF7YpaUAXJ8
x8EAoJIqeIaiu/l+tPqRD00uY12FJYY9
=kZJt
-----END PGP SIGNATURE-----

--nextPart1526605.uEMsf57ztV--

