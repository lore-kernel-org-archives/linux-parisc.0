Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01A854840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  2 Feb 2004 22:50:20 -0700 (MST)
Date: Tue, 3 Feb 2004 00:50:45 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] gcc/config/pa/ftpr.c fixes for new
	TRAMPOLINE_TEMPLATE in hppa's glibc.
Message-ID: <20040203055045.GC11884@baldric.uwo.ca>
References: <20040131222832.GB19840@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040131222832.GB19840@baldric.uwo.ca>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I'm not quite sure what the "-4" is intended to accomplish, I figure I
> could have prefixed the TREAMPOLINE_TEMPLATE with another jump that
> gives the right address? That still makes for an extra jump, and I'd
> rather have gcc just look in the right place first.
 
The easier fix is to change dl-machine.h to read:

    505 #define TRAMPOLINE_TEMPLATE(tramp_name, fixup_name)                     \
    506   extern void tramp_name (void);                                        \
    507   asm (                                                                 \
    508  "      .text\n"                                                        \
    509         /* FAKE bl to provide gcc's __cffc with fixup's address */      \
    510  "      bl      " #fixup_name ",%r2\n" /* Runtime address of fixup */   \
    511  "      .globl " #tramp_name "\n"                                       \
    512  "      .type " #tramp_name ",@function\n"                              \
    513   #tramp_name ":\n"                                                     \
    514         /* Save return pointer */                                       \
    515  "      stw     %r2,-20(%sp)\n"                                         \

The addition of the *fake* bl in that .text before the function allows gcc
to use the "-4" lookup to find the right 17-bit displacement towards "fixup"

The patch below *can* still go into gcc, and will speedup __cffc when running
with the new glibc.

The above changes are added into the latest glibc patches at:
http://www.parisc-linux.org/~carlos/glibc-hppa-patches-latest.tar.gz


> 2004-01-31  Carlos O'Donell  <carlos@baldric.uwo.ca>
> 
> 	* gcc/config/pa/fptr.c (__canonicalize_funcptr_for_compare): Add
> 	extra offset check for new glibc TRAMPOLINE_TEMPLATE.
> 
> Index: gcc/config/pa/fptr.c
> ===================================================================
> RCS file: /cvs/gcc/gcc/gcc/config/pa/fptr.c,v
> retrieving revision 1.2
> diff -u -p -r1.2 fptr.c
> --- gcc/config/pa/fptr.c	9 Dec 2002 19:16:14 -0000	1.2
> +++ gcc/config/pa/fptr.c	31 Jan 2004 22:18:27 -0000
> @@ -35,7 +35,7 @@ Boston, MA 02111-1307, USA.  */
>     the template should it be necessary to change the current branch
>     position.  */
>  #define NOFFSETS 2
> -static int fixup_branch_offset[NOFFSETS] = { 32, -4 };
> +static int fixup_branch_offset[NOFFSETS] = { 36, 32, -4 };
>  
>  #define GET_FIELD(X, FROM, TO) \
>    ((X) >> (31 - (TO)) & ((1 << ((TO) - (FROM) + 1)) - 1))
