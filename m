From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Sat, 2 Dec 2006 16:13:22 -0500 (EST)
Message-ID: <200612022113.kB2LDNrS007088__34978.7914463834$1416624226$gmane$org@hiauly1.hia.nrc.ca>
References: <200612021621.03867.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 carlos@baldric.uwo.ca
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200612021621.03867.deller@gmx.de> from "Helge Deller" at Dec 2, 2006 04:21:03 pm
List-ID: <linux-parisc.vger.kernel.org>

> a)
> LABEL: 		.equ VALUE		; NOTE: LABEL with COLON ':'
> worked before on Linux, will still work. No idea about HPUX

It works on hpux.

> b)
> LABEL 		.equ VALUE		 ; NOTE: LABEL without COLON ':'
> never worked on Linux, and will still not work. 
> Standard on HPUX, so gnu as never followed HP-UX here.

This also works on hpux.  I don't understand your comment about
GNU as not following the behavior of HP as.  This is the only
variant allowed by HP as.

> c)
> 			.equ VAR,VALUE 
> standard gnu syntax. Didn't worked before on Linux. Will work now.
> HP-UX probably never allowed this one.

This isn't good enough.  Either it should work under hpux or be rejected.

> d)
> LABEL:		.equ VAR,VALUE
> never worked on Linux. Will still not work. Use eiter "LABEL:" or "VAR".
> HP-UX probably never allowed this one.

Probably, pa_equ should be updated to check that the rest of the line
is empty.  See s_set for an example.

> @@ -3262,7 +3262,7 @@
>        return;
>      }
>  
> -  /* Look up the opcode in the has table.  */
> +  /* Look up the opcode in the hash table.  */
>    if ((insn = (struct pa_opcode *) hash_find (op_hash, str)) == NULL)
>      {
>        as_bad ("Unknown opcode: `%s'", str);

This typo fix should be a separate patch.  It's fine with the addition
of a ChangeLog entry.

> @@ -6397,8 +6397,11 @@
>      {
>        if (reg)
>  	as_bad (_(".REG must use a label"));
> -      else
> -	as_bad (_(".EQU must use a label"));
> +      else {
> +	/* Try gas' standard ".equ X,Y" pseudo opcode.  */
> +      	s_set(0);
> +	return;
> +      }

I still have a problem with this part.  It drops the ".EQU must use a label"
error message and s_set has no equivalent error message.  In order to support
the alternative syntax, you need to parse the rest of the manner similar
to that done in s_set.  We need a message that handles both ".EQU must use
a label" and "expected symbol name".

The other problem that I see is the dropping of the check on the
expression value:

          fudge_reg_expressions = 1;
	  seg = expression (&exp);
	  fudge_reg_expressions = 0;
	  if (exp.X_op != O_constant
	      && exp.X_op != O_register)
	  ...

This is likely to be problematic under hpux.  Even under linux,
the two alternative forms don't handle equivalences in the same
way.  Compare what assign_symbol does compared with pa_equ.

It's certainly possible to do the checks described above.  However,
I have to wonder if it wouldn't be simpler to just do the following:

#if !(defined (OBJ_ELF) && (defined (TE_LINUX) || defined (TE_NetBSD)))
  {"equ", pa_equ, 0},
#endif

This would yield the normal GNU syntax under linux and netbsd, and
retain the existing syntax for other targets.  This might cause some
current code to fail but it's not a problem for GCC.

>  @ifset HPPA
> -The syntax for @code{equ} on the HPPA is 
> -@samp{@var{symbol} .equ @var{expression}}.
> +On HPPA the following syntax may be used alternatively:
> +@samp{@var{symbol:} .equ @var{expression}}

This also isn't quite right.  See my comment to "b)".  Symbol must
be a label symbol.

>  @ifset HPPA
> -The syntax for @code{set} on the HPPA is
> -@samp{@var{symbol} .set @var{expression}}.
> +Alternatively the syntax for @code{set} on the HPPA is
> +@samp{@var{symbol:} .set @var{expression}}.
>  @end ifset

Both the original and proposed change aren't right.  There is no
special handling for .set on HPPA (see md_pseudo_table).  So, the
HPPA bit can just be deleted.

In standard GNU syntax, .equ and .set are synonyms.  Since .set has
the standard behavior, it can be used instead of .equ.  That's why
I question modifying the syntax of .equ, but I will accept the
change if it provides a behavior similar to the current behavior.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
