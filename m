Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA18512
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 09:32:01 -0600
Received: from chrome.rose.hp.com (kirkb@chrome.rose.hp.com [15.8.150.209])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id IAA20632
	for <parisc-linux@thepuffingroup.com>; Tue, 15 Jun 1999 08:31:46 -0700 (PDT)
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199906151532.IAA22453@chrome.rose.hp.com>
Subject: Re: [parisc-linux] Compiling Linux Kernel on HP-UX
To: Ulrich.Strelow@schering.de
Date: Tue, 15 Jun 1999 8:32:41 PDT
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <C1256791.00392418.00@BE2314.schering.de>; from "Ulrich.Strelow@schering.de" at Jun 15, 99 12:22 (noon)
List-ID: <linux-parisc.vger.kernel.org>

|
| Hi,
|
| I'm trying to compile the latest CVS-snapshot (19990615) on my HP 715/33
| using gcc 2.7.2.2 and binutils 2.7. Compiling kernel/sched.c gives the
| following error:
|
| sched.c:579: section attributes are not supported for this target
|
| I am running HP-UX 10.20, so I cannot use the depots from
| ftp://puffin.external.hp.com/pub/parisc/binaries/depot/.
| So the question is: do I need gcc 2.8.1 and binutils 2.9.1 to build the
| kernel on HP-UX or is this some other error ?
|

gcc 2.8.1 isn't quite enough. Although it does support section
attributes, there is a bug in the code emitted that cannot be assembled
with gas 2.9.1. I sucessfully worked around it by changing the condition
from a fatal error to a warning in gas.

Here is the text of the bug I submitted to gcc:


e of __attribute__((__section__())) to force code into a specific
section
generates code which causes the assembler to fail.

Here is an example:

/* test.c */
int __attribute__ ((__section__ (".text.init")))  a(x)
int x;
{
 return(x+1);
}

int b(x)
int x;{
 return(x+2);
}

int __attribute__ ((__section__ (".text.init")))  c(x)
int x;{
 return(x+1);
}

main(){
 printf("a(0)=%d\n",a(0));
 printf("b(0)=%d\n",b(0));
 printf("c(0)=%d\n",c(0));
}


Here is the output of gcc:

# gcc test.c
/var/tmp/cca10410.s: Assembler messages:
/var/tmp/cca10410.s:59: Warning: Parameters of an existing subspace
can't be modified
/var/tmp/cca10410.s:59: Error: Rest of line ignored. First ignored
character is`,'.

Creating the assembly language output and examining for .SUBSPA
directives, we
find the following:

# gcc -S test.c
# grep SUBSPA test.s

# gcc -S test.c
# grep SUBSPA test.s
        .SUBSPA $DATA$,QUAD=1,ALIGN=8,ACCESS=31
        .SUBSPA $BSS$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=82
        .SUBSPA $LIT$,QUAD=0,ALIGN=8,ACCESS=44
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY
        .SUBSPA .text.init,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY,SORT=24
        .SUBSPA a
        .SUBSPA $CODE$
        .NSUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY
        .SUBSPA .text.init,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY,SORT=24
        .SUBSPA c
        .SUBSPA $LIT$
        .SUBSPA $CODE$
        .NSUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY

Note that the section .text.init is declared with all the parameters
twice.
The second occurance should not include the parameters.

If the second declaration is edited to remove the parameters, then the
code
assembles and run correctly.

# cp test.s test_fixed.s
# vi test_fixed.s
# diff test.s test_fixed.s
59c59
<       .SUBSPA .text.init,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY,SORT=24
---
>       .SUBSPA .text.init
# gcc -o test_fixed test_fixed.s
# ./test_fixed
a(0)=1
b(0)=2
c(0)=1


KMB
--
+============================================================+
|       Kirk Bresniker          (916) 785-5677               |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
