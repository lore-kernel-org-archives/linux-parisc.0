Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA29118
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 May 2000 20:03:20 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by atlrel1.hp.com (Postfix) with ESMTP id C5285E44E
	for <parisc-linux@thepuffingroup.com>; Wed, 10 May 2000 16:03:23 -0400 (EDT)
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error 
In-reply-to: Your message of "Mon, 01 May 2000 11:41:00 PDT."
             <200005011841.LAA11187@milano.cup.hp.com>
Date: Wed, 10 May 2000 14:03:17 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12pchR-0005Kc-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= "make" died with the following error:
= 
= /linux/grundler/glibc/hppa1.1-linux/csu/crti.S: Assembler messages:
= /linux/grundler/glibc/hppa1.1-linux/csu/crti.S:42: Fatal error: Nested proced
ures
= 
= Sure enough, two .PROC's have no .PROCEND in between.

I think I've figured this out, and it'll take a glibc expert to do
the *right* thing vis-a-vis the complex glibc structure.

Let's ignore the .fini section and just deal with .init.  This is the
section where code which needs to execute prior to main() is placed.  It
is in effect a normal assembly-language procedure whose contents are
created at link-time.  The procedure looks like this (somewhat simplified):

    .globl _init
	    .EXPORT _init,ENTRY
	    .type    _init,@function
    _init:
	    .PROC
	    .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3
	    .ENTRY
	    a few assembly statements

	    /***** pre-main() code to be inserted here *******/

	    a few more assembly statements
	    .EXIT
	    .PROCEND

glibc wants to place the first part (up to the comment) into crti.S, and
the second part into crtn.S, then at link time something like this happens:

	ld -o a.out crti.o users's-object-files crtn.o

Inside the user's object files, if they need something called before main(),
like a C++ static constructor, you might find code like this:

	.section .init
	bl,n my-static-constructor,%r2

Thus the _init procedure is created is link time, but that's not the problem.

The problem is that the neither the first scrap of code nor the second
will assemble, because there's a .PROC without .PROCEND and .ENTRY
without .EXIT.  .ENTRY and .EXIT both produce code, .ENTRY depends on
.CALLINFO which depends a tad upon .PROC.

If we hand-code the .ENTRY and .EXIT sequences, we can nuke all the
troublesome assembler directives and fix this... simple!...

except for the way this code got generated in the first place.
It's generated in glibc/csu by 'gcc -S initfini.c' and then
hacking the generated assembly, which contains the .PROC,.ENTRY,etc...

So one thing we could do is hack gcc to produce its own entry/exit
assembly code generation.  Another thing we could do is make the
assembler very forgiving.  Perhaps the best thing we could do is find a way
to insert PA-specific handwritten assembly for these two files
into the glibc build.  I can't figure out how to do this without
making glibc specific only to PA.  Help!

	-Paul Bame
