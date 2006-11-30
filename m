From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Thu, 30 Nov 2006 11:13:31 -0500 (EST)
Message-ID: <200611301613.kAUGDV3J004744__41816.1709014841$1416624224$gmane$org@hiauly1.hia.nrc.ca>
References: <200611282034.01241.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 dave.anglin@nrc.ca
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200611282034.01241.deller@gmx.de> from "Helge Deller" at Nov 28, 2006 08:34:01 pm
List-ID: <linux-parisc.vger.kernel.org>

> deller@c3000:~/binutils/run/bin$ cat test.s
> AA       .equ  4
> BB      .equ  6
> deller@c3000:~/binutils/run/bin$ as test.s
> test.s: Assembler messages:
> test.s:1: Error: Unknown opcode: `aa'
> test.s:2: Error: Invalid operands

This is because the linux target was changed to require colons after
labels.  As a result, operands can start in the first column of a line.
Under hpux, there needs to be at least one white space character before
an operand and labels have to start in the first column.

> although as.info states:
> 
> 7.37 `.equ SYMBOL, EXPRESSION'
> ==============================
> 
> This directive sets the value of SYMBOL to EXPRESSION.  It is
> synonymous with `.set'; see *Note `.set': Set.
> 
>    The syntax for `equ' on the HPPA is `SYMBOL .equ EXPRESSION'.

This doesn't reflect that SYMBOL needs to be followed by a colon
on HPPA linux.  So, the documentation needs updating.

Probably, the linux should have been updated to use the normal GNU
syntax when it was introduced.  Now, updating the syntax involves a
potential compatibility break with GCC and existing assembler code.
At the moment, I don't see a strong need to do the update.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
