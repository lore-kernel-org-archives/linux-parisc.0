Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout04.sul.t-online.com (mailout04.sul.t-online.com [194.25.134.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6A1B4838
	for <parisc-linux@parisc-linux.org>; Sun, 27 Apr 2003 14:02:41 -0600 (MDT)
Received: from nikita.ath.cx (localhost [127.0.0.1])
	by nikita.ath.cx (8.12.3/8.12.3/Debian-5) with ESMTP id h3RK4KkS030959
	for <parisc-linux@parisc-linux.org>; Sun, 27 Apr 2003 22:04:21 +0200
Received: (from pappy@localhost)
	by nikita.ath.cx (8.12.3/8.12.3/Debian-5) id h3RK4JQ8030957
	for parisc-linux@parisc-linux.org; Sun, 27 Apr 2003 22:04:19 +0200
From: Alexander Gabert <pappy@nikita.ath.cx>
Date: Sun, 27 Apr 2003 22:04:18 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <20030427200418.GA30929@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] -fPIC position independent code on parisc
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

hi,

can someone explain the difference between "normal" and "-fPIC"?

i have compiled a test program:

#include <stdio.h>

int main(void) {
        printf("hello\n");
        return(0);
}

first one without -fPIC
gcc -S hello.c

     1          .LEVEL 1.1
     2          .section        .rodata
     3          .align 4
     4  .LC0:
     5  .stringz"hello\n"
     6          .text
     7          .align 4
     8  .globl main
     9                  .type            main,@function
    10  main:
    11          .PROC
    12          .CALLINFO FRAME=64,CALLS,SAVE_RP,SAVE_SP,ENTRY_GR=3
    13          .ENTRY
    14          stw %r2,-20(%r30)
    15          copy %r3,%r1
    16          copy %r30,%r3
    17          stwm %r1,64(%r30)
    18          ldil LR'.LC0,%r19
    19          ldo RR'.LC0(%r19),%r26
    20          bl printf,%r2
    21          nop
    22          ldi 0,%r28
    23          ldw -20(%r3),%r2
    24          ldo 64(%r3),%r30
    25          ldwm -64(%r30),%r3
    26          bv,n %r0(%r2)
    27          .EXIT
    28          .PROCEND
    29  .Lfe1:
    30          .size   main,.Lfe1-main
    31          .ident  "GCC: (GNU) 3.0.4"

second one with -fPIC
gcc -S -fPIC hello_fPIC.c

     1          .LEVEL 1.1
     2          .section        .rodata
     3          .align 4
     4  .LC0:
     5  .stringz"hello\n"
     6          .text
     7          .align 4
     8  .globl main
     9                  .type            main,@function
    10  main:
    11          .PROC
    12          .CALLINFO FRAME=64,CALLS,SAVE_RP,SAVE_SP,ENTRY_GR=4
    13          .ENTRY
    14          stw %r2,-20(%r30)
    15          copy %r3,%r1
    16          copy %r30,%r3
    17          stwm %r1,64(%r30)
    18          stw %r4,8(%r3)
    19          stw %r19,-32(%r30)
    20          copy %r19,%r4
    21          addil LT'.LC0,%r19
    22          ldw RT'.LC0(%r1),%r1
    23          copy %r1,%r26
    24          bl printf,%r2
    25          nop
    26          copy %r4,%r19
    27          ldi 0,%r28
    28          ldw -20(%r3),%r2
    29          ldw 8(%r3),%r4
    30          ldo 64(%r3),%r30
    31          ldwm -64(%r30),%r3
    32          bv,n %r0(%r2)
    33          .EXIT
    34          .PROCEND
    35  .Lfe1:
    36          .size   main,.Lfe1-main
    37          .ident  "GCC: (GNU) 3.0.4"

i know that it is needed for shared libraries...
but what exactly is position independent code?

gcc is version 3.0.4
glibc is version 2.2.5


thanks in advance,

Alex
--
pub  1024/05E1A80C 2001/12/16 Alexander Gabert (http://nikita.ath.cx) <pappy@nikita.ath.cx>
          Key fingerprint =  2D 84 B0 CB F5 67 8A 22  8D 37 6E 6B 8A 3B 7F D6  05 E1 A8 0C
