From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] c3k panics
Date: Tue, 31 May 2005 07:41:49 +0200
Message-ID: <4282FEEE0000724C@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randolph,

>
> > #ifndef CONFIG_64BIT
> >         .macro fixup_branch,lbl
> >         b           \lbl
> >         .endm
> > #else
> >         .macro fixup_branch,lbl
> >         ldil        L%\lbl, %r1
> >         ldo         R%\lbl(%r1), %r1
> >         bv,n        %r0(%r1)
> >         .endm
> > #endif
>
> These two do the same thing. The 32-bit version is simpler because we
> can rely on the linker to do fixups for us if the branch is too far
> away. The 64-bit version always uses a long branch sequence to avoid
> stub issues with the 64-bit toolchain. In the C code I have simply not
> done this (micro-)optimization.
>
Ok clear but still confused why 32bit branch doesn't nullify the insn
in delay slot like did 64bit?

btw one more thing confusing me: the third fixup_branch macro definition
in lusercopy.S:
[snip]
         .macro fixup_branch,lbl
         ldil        L%\lbl, %r1
         ldo         R%\lbl(%r1), %r1
         bv          %r0(%r1)
         .endm

This time just bv not bv,n ?
I presume that's needed because here that's user space but couldn't we ha=
ve
2 macro name (e.g a k_fixup_br, us_fixup_br)  to avoid this confusion?

Thanks again,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
