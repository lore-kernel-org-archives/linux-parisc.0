Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id AA396482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 Nov 2001 16:19:47 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	jochen@scram.de (Jochen Friedrich)
Subject: Re: [parisc-linux] Current Debian still broken?
Date: Sun, 11 Nov 2001 00:19:10 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <200111102256.fAAMu8HB001322@hiauly1.hia.nrc.ca>
In-Reply-To: <200111102256.fAAMu8HB001322@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Message-Id: <20011110231947.AA396482C@dsl2.external.hp.com>
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

On Saturday 10 November 2001 23:56, John David Anglin wrote:
> > when trying to compile the new 2.2.14 based parisc tree, i get the
> > following error:
> >
> > gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes
> > -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common
> > -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
> > -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
> > -mschedule=7100    -c -o sd.o sd.c
> > {standard input}: Assembler messages:
> > {standard input}:583: Error: Invalid operands
> > {standard input}:607: Error: Invalid operands
> > make[3]: *** [sd.o] Error 1

This is a kernel problem, where we use the "std" assembler command to store a 
u64 value to user-space:
See at include/asm-parisc/uaccess.h:  macro __put_user:
  case 8: __put_kernel_asm("std",x,ptr); break;       \

Sadly "std" is only available on 64 bit PA CPUs and gcc knows that and give you
the above error in 32bit kernel builds.

Greetings,
Helge.
