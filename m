Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6321F482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 Nov 2001 15:29:02 -0700 (MST)
Received: from www2.scram.de (www2.scram.de [195.226.127.84])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id fAAMSn626576
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 Nov 2001 23:28:49 +0100 (CET)
Date: Sat, 10 Nov 2001 23:28:48 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.NEB.4.33.0111102323090.11348-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Current Debian still broken?
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

Hi,

when trying to compile the new 2.2.14 based parisc tree, i get the
following error:

gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common
-D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100    -c -o sd.o sd.c
{standard input}: Assembler messages:
{standard input}:583: Error: Invalid operands
{standard input}:607: Error: Invalid operands
make[3]: *** [sd.o] Error 1

Cheers,
Jochen
