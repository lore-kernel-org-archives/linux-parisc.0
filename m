From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] uninline in bitops.c as ia64 or sparc64?
Date: Mon, 9 Aug 2004 12:15:30 -0500
Message-ID: <200408091215.30941.mszick@goquest.com>
References: <40C36EFD.6040002@tiscali.be> <1091293141.1920.34.camel@mulgrave>
	<200408090954.08340.mszick@goquest.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408090954.08340.mszick@goquest.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon August 9 2004 09:54, Michael S. Zick wrote:
>
-------
> 
> Mike
> 
> Index: include/asm-parisc/bitops.h
> ===================================================================
> RCS file: /opt/lib/cvs/parisc/include/asm-parisc/bitops.h,v
> retrieving revision 1.1.1.1
> diff -u -3 -p -r1.1.1.1 bitops.h
Sorry for the self-reply...

If compiled with 32-bit compiler the NOT(__LP64__) path will compile.
If the resultant program is loaded on a 64-bit machine running 'narrow mode';
it will fail.  Since the mode bit only changes the addressing not the 
bit-position numbering.(1)

Translation:
As submitted, it should compile for 64-bit and run 64-Wide;
it should compile for 32-bit and run 32-bit.
It is only the case of compiling for 32-bit and then trying to
run it on a 64-bit machine in narrow mode that should fail.

I'll work on this - I probably will abuse the shift-right-double
instruction to come up with a compiles correctly, runs anywhere
version.

Two other problems I am considering:

1) It only beats on two (not counting GR0) registers;
it will probably cause register stalls on pipelined machines.

2) It is bigger than a cache line, probably executes in less
than a memory cycle - so it will probably 'starve' the cpu;
waiting for the next memory cycle to fill the next i-cache line.

Taken all together - an interesting problem.

Mike
(1) Does 32-bit gcc ever generate extract/deposit? This might
cause problems running anything 32-bit on 64-bit-narrow.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
