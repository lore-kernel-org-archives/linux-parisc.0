Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A32C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Sep 2002 11:48:28 -0600 (MDT)
Message-Id: <200209091727.g89HRZF3021659@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Inline Assembly Help request
To: jsoe0708@tiscali.be
Date: Mon, 9 Sep 2002 13:27:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D3815AF0000F2CA@ocpmta3.be.tiscali.com> from "jsoe0708@tiscali.be" at Sep 9, 2002 06:27:22 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> But I do not yet find explanation about details of the following asm code:
> #define __put_user_asm(stx,x,ptr)                           \
>         __asm__ __volatile__ (                              \
>                 "\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
>                 "2:\n"                                      \
>                 "\t.section __ex_table,\"a\"\n"             \
>                  "\t.word\t1b\n"                            \
>                  "\t.word\t(2b-1b)+1\n"                     \
>                  "\t.previous"                              \
>                 : "=r"(__pu_err)                            \
>                 : "r"(ptr), "r"(x), "0"(__pu_err))
> 
> which is more clear with gcc -S:
> 
> 1:      stw     %r21,0(%sr3,%r19)
> 2:
>         .section __ex_table,"a"
>         .word   1b
>         .word   (2b-1b)+1
>         .previous
> 
> My questions are:
> what are the actual means "1:", "2:" (seems like label?)

They are local labels that can be referenced in the asm.  "b" and "f"
mean backwards and forward relative to the current location.  This more
or less doubles the number of labels available.

> and what means the rest
> ".section __ex_table,...
>  ...
>  .previous"
> 
> I do not yet found reference on this part (even in Assembly-HOWTO).
> Where could I found doc on this details?

The GCC manual (extend.texi) has documentation on writing asms.  You
will need to look at the pa-risc architecture manuals for documentation
on PA assembler instructions.

The code is trying to setup a table using local labels generated
in the asm.  The way to do this is highly port dependent.
In particular, indirect function calls are done using plabels on
the PA.  There are also restrictions on the types of relocations
that can be used for constructing tables of this kind.

This is highly complex stuff and isn't very well documented.  You
can read the HP runtime architecture document, the documentation on
ELF relocations and look at the code in the GNU assembler and linker.
The dwarf2 exception tables that you can generate with gcc 3.3
may also give some clue.  Look at the entry for the personality
function and how the labels for C++ catches are encoded in the table.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
