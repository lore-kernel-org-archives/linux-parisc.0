Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 434DF482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 00:35:43 -0700 (MST)
Date: Mon, 27 Jan 2003 23:31:01 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030128073101.GD20940@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030126044656.GB6057@dsl2.external.hp.com> <200301260509.h0Q59ntl001762@hiauly1.hia.nrc.ca> <20030127072615.GF8487@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030127072615.GF8487@tausq.org>
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

> well.... Grant and I did some more debugging on this.... here's what
> we've tried so far:

ok, here's what's happening apparently.... (with many thanks to Grant 
for a sharp eye :)

The pty_init() function does a number of structure copies. e.g.

init_termios is a 36-byte structure.

	pty_driver.init_termios = tty_std_termios;
	pty_driver.init_termios.c_iflag = 0;
	pty_driver.init_termios.c_oflag = 0;
	pty_driver.init_termios.c_cflag = B38400 | CS8 | CREAD;
	pty_driver.init_termios.c_lflag = 0;

gcc translates this to something like this:
    /* %r4 is &pty_driver */
    ldo 28(%r4),%r23
    ldi 28,%r21
    ldw,ma 4(%r22),%r20
    ldw,ma 4(%r22),%r19
    stw,ma %r20,4(%r23)
    addib,>= -8,%r21,.-12
    stw,ma %r19,4(%r23)
    /* ... */
    stw %r0,28(%r4)
    stw %r0,32(%r4)
    stw %r10,36(%r4)
    stw %r0,40(%r4)

When optimizations are turned on, gcc reschedules some of those final 
stw insns above the structure copy loop. When the structure copy 
happens, the values get overwritten. ick.

this was kind of interesting to debug :) but i have no idea how to fix
it. Dave? :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
