Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 760EA4830
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jul 2003 10:17:36 -0600 (MDT)
Date: Sun, 13 Jul 2003 09:20:54 -0700
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org, Helge Deller <deller@gmx.de>
Message-ID: <20030713162054.GF20673@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3F117AA5.6090402@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F117AA5.6090402@tiscali.be>
Subject: [parisc-linux] Re: Xfree-server and Xhp ?
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

> Into mklinux sources I also find back <machine/asm.h> it would be easy with 
> the help of kernel documentation to 'reverse' it for parisc linux (seems to 
> be trivial).

> Does it exist some doc or tips to do this kind of obj translation 'som' -> 
> 'elf'?

well, not that i know of, but it should work almost as is. most of these
are actually differences between the HP assembler and the GNU assembler,
rather than differences between SOM and ELF.

> >      .space  $TEXT$
> >      .subspa $CODE$

change to ".text"

> >
> >      .import ngleScreenPrivIndex,data
> >
> >      .export ngleDepth8_CopyAreaFromToScreen
> >      .proc
> >      .callinfo
> >
> >ngleDepth8_CopyAreaFromToScreen
add colon (:) at end

> >      ldo 0x40(sp),sp
> >      stw arg0,-0x64(sp)
> >      stw arg1,-0x68(sp)
> >      stw arg2,-0x6c(sp)
> >      stw arg3,-0x70(sp)
> >      ldw -0x68(sp),r1
> [...]
> (arg[0..3], r[0..], t[1..4] beeing labels defined <machine/asm.h>)

shouldn't need the labels, the assembler recognizes these. but you need
to put % in front of all the register names in order for the GNU
assembler to accept the input. (ldo 0x40(%sp),%sp, etc)

HTH,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
