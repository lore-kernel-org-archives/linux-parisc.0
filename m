From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Tue, 28 Nov 2006 20:34:01 +0100
Message-ID: <200611282034.01241.deller@gmx.de>
References: <200611270134.kAR1Y2k0025862@hiauly1.hia.nrc.ca>
	<200611282020.26412.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611282020.26412.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tuesday 28 November 2006 20:20, Helge Deller wrote:
> As a background story:
> Originally I wanted to add support for
> VAR		.equ  VALUE
> as it's e.g. documented here: http://docs.hp.com/en/92432-90012/ch02.html
> (JAN   .equ  1).

There is more broken:

deller@c3000:~/binutils/run/bin$ cat test.s
AA       .equ  4
BB      .equ  6
deller@c3000:~/binutils/run/bin$ as test.s
test.s: Assembler messages:
test.s:1: Error: Unknown opcode: `aa'
test.s:2: Error: Invalid operands

although as.info states:

7.37 `.equ SYMBOL, EXPRESSION'
==============================

This directive sets the value of SYMBOL to EXPRESSION.  It is
synonymous with `.set'; see *Note `.set': Set.

   The syntax for `equ' on the HPPA is `SYMBOL .equ EXPRESSION'.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
