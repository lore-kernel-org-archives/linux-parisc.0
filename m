From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Mon, 13 Mar 2006 09:24:42 -0500
Message-ID: <119aab440603130624q5bf3c9e0l4451a2ec2161253@mail.gmail.com>
References: <no.id> <200603122015.k2CKF93h017275@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603122015.k2CKF93h017275@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Index: config/pa/pa32-linux.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- config/pa/pa32-linux.h      (revision 111979)
> +++ config/pa/pa32-linux.h      (working copy)
> @@ -1,5 +1,5 @@
>  /* Definitions for PA_RISC with ELF-32 format
> -   Copyright (C) 2000, 2002, 2004 Free Software Foundation, Inc.
> +   Copyright (C) 2000, 2002, 2004, 2006 Free Software Foundation, Inc.
>
>  This file is part of GCC.
>
> @@ -36,4 +36,29 @@
>                     aligned(sizeof(func_ptr))))                         \
>      =3D { (func_ptr) (-1) }
>
> +/* This is a PIC version of CRT_CALL_STATIC_FUNCTION.  The PIC
> +   register has to be saved before the call and restored after
> +   the call.  We assume that register %r4 is available for this
> +   purpose.  The hack prevents GCC from deleting the restore.  */
> +#ifdef CRTSTUFFS_O
> +#undef CRT_CALL_STATIC_FUNCTION
> +#define CRT_CALL_STATIC_FUNCTION(SECTION_OP, FUNC)     \
> +static void __attribute__((__used__))                  \
> +call_ ## FUNC (void)                                   \
> +{                                                      \
> +  asm (SECTION_OP);                                    \
> +  asm volatile (".call\n\t"                            \
> +               "bl " #FUNC ",%%r2\n\t"                 \
> +               "copy %%r19,%%r4\n\t"                   \
> +               "copy %%r4,%%r19\n"                     \
> +               :                                       \
> +               :                                       \
> +               : "r1", "r2", "r4", "r20", "r21",       \
> +                 "r22", "r24", "r24", "r25", "r26",    \
> +                 "r27", "r28", "r29", "r31");          \
> +  FORCE_CODE_SECTION_ALIGN                             \
> +  asm (TEXT_SECTION_ASM_OP);                           \
> +}
> +#endif
> +
>  #define MD_UNWIND_SUPPORT "config/pa/linux-unwind.h"

Awesome, I hope this works. Thanks Randolph and Dave for the
sleuthing!

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
