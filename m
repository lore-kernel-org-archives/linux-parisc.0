Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6EEF1482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 Nov 2001 15:56:10 -0700 (MST)
Message-Id: <200111102256.fAAMu8HB001322@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Current Debian still broken?
To: jochen@scram.de (Jochen Friedrich)
Date: Sat, 10 Nov 2001 17:56:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.NEB.4.33.0111102323090.11348-100000@www2.scram.de> from "Jochen Friedrich" at Nov 10, 2001 11:28:48 pm
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

> when trying to compile the new 2.2.14 based parisc tree, i get the
> following error:
> 
> gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes
> -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common
> -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
> -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
> -mschedule=7100    -c -o sd.o sd.c
> {standard input}: Assembler messages:
> {standard input}:583: Error: Invalid operands
> {standard input}:607: Error: Invalid operands
> make[3]: *** [sd.o] Error 1

Don't know if this is the fix but it fixed an invalid operand error in
the gcc mainline code:

2001-10-31  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa.c (output_move_double): Fix typo in double load.

--- pa.c.save	Wed Oct 31 11:24:25 2001
+++ pa.c	Wed Oct 31 12:47:53 2001
@@ -1979,7 +1979,7 @@
 		 save a register file writeback)  */
 	      if (GET_CODE (addr) == POST_INC)
 		return "{ldws|ldw},ma 8(%1),%0\n\tldw -4(%1),%R0";
-	      return "{ldws|ldw},ma -8(%1),%0\n\tldw 12(%1),%R0}";
+	      return "{ldws|ldw},ma -8(%1),%0\n\tldw 12(%1),%R0";
 	    }
 	  else
 	    {

If that isn't it, dump the assembler output with '-S' and look at the
lines causing the error.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
