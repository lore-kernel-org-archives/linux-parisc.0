From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] i386 cross-compiler for hppa/hppa64 ?
Date: Wed, 15 Sep 2004 21:33:30 +0200
Message-ID: <200409152133.30899.deller@gmx.de>
References: <200409152113.57033.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409152113.57033.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 15 September 2004 21:13, Helge Deller wrote:
> running today into the following compile problem with current PARISC CVS HEAD with my old gcc 3.0.2 i386/hppa crosscompiler:
> ....
>   CC      arch/parisc/kernel/unaligned.o
> {standard input}: Assembler messages:
> {standard input}:158: Error: operation combines symbols in different segments
> make[1]: *** [arch/parisc/kernel/unaligned.o] Error 1

this is the problematic code btw (in case it helps somebody):
....
        .section        .text.emulate_ldd,"ax",@progbits
        .align 4
                .type            emulate_ldd,@function
emulate_ldd:
        .PROC
        .CALLINFO FRAME=64,NO_CALLS,ENTRY_GR=4
        .ENTRY
        stwm %r5,64(%r30)
.....
        .section .fixup,"ax"
......

.Lfe3:
        .size   emulate_ldd,.Lfe3-emulate_ldd		<<<<<<<<<<<<<<<<<< LINE 158 !! <<<<<<<<<<<<<<
        .section        .text.emulate_sth,"ax",@progbits
        .align 4
                .type            emulate_sth,@function
emulate_sth:
        .PROC
        .CALLINFO FRAME=0,NO_CALLS
        .ENTRY
        copy %r26,%r19
.....
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
