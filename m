Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C2024829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Jan 2003 00:30:54 -0700 (MST)
Date: Sun, 26 Jan 2003 23:26:15 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030127072615.GF8487@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030126044656.GB6057@dsl2.external.hp.com> <200301260509.h0Q59ntl001762@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301260509.h0Q59ntl001762@hiauly1.hia.nrc.ca>
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

> You could try using "objdump -d" on the .o's, then diff'ing.  However
> the diff might be large.  Probably, comparing .S files would be
> best.  Don't use "-g".  However, if you find a difference that looks
> suspicious, "-g" will help you locate the source line.

well.... Grant and I did some more debugging on this.... here's what
we've tried so far:

- pty.c compiled completely with 3.2.2 => crash
- pty.c compiled completely with 3.0.4 => ok
- all the functions except pty_init compiled with 3.2.2, and with
pty_init compiled with 3.0 => ok
- pty.c compiled with 3.2.2 with only one of -fno-schedule-insns
  or -fno-schedule-insns2 => crash
- pty.c compiled with 3.2.2 with both -fno-schedule-insns and
  -fno-schedule-insns2 => ok

For reference, this is the original compile line:
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I /usr/lib/gcc-lib/hppa-linux/3.2.2/include -DKBUILD_BASENAME=pty  -DEXPORT_SYMTAB -c pty.c

here are the corresponding assembly files:
without -fno-schedule-insns -fno-schedule-insns2
    http://www.parisc-linux.org/~tausq/pty.s-opt
with -fno-schedule-insns -fno-schedule-insns2
    http://www.parisc-linux.org/~tausq/pty.s-noopt
diff -ywb output
    http://www.parisc-linux.org/~tausq/pty.s.diff

still need to look at the asm output a bit more carefully....

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
