Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout09.sul.t-online.com (mailout09.sul.t-online.com [194.25.134.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9768482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 13:58:25 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: H_Aue@t-online.de (Hinrich Aue)
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 27 Dec 2001 22:02:09 +0100
MIME-Version: 1.0
Message-ID: <16JhbT-1jD9EmC@fwd05.sul.t-online.com>
Subject: [parisc-linux] DSL on a 715/80 with rp-pppoe
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

Hi there,

I tried to install rp-pppoe on my 715/80, and it worked until one point, when 
I try to start the pppd and the box crashes instantly.

There is a massive stackdump or so, and I don't know how to catch it up and 
submit it :-(

perhaps it's a ppp problem.

Another strange thing is, that I succsessfully load the ne Module for my 
ne2000 ISA Adapter in my  715/80, but there's also a stackdump:

//------------------------------------

ne.c:v1.10 9/23/94 Donald Becker (becker@scyld.com)
Last modified Nov 1, 2000 by Paul Gortmaker
NE*000 ethercard probe at 0x320: 00 00 1c 10 84 86
eth1: NE2000 found at 0x320, using IRQ 5.
break 0,0: pid=101 command='keventd'
keventd (pid 101): Breakpoint (code 0)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 102bb010 00000000 00000000
r04-07  00000000 00000000 00000000 00000000
r08-11  00000000 00000000 00000000 00000000
r12-15  00000000 00000000 00000001 101224d8
r16-19  1bb405c0 00000002 00000000 1061de40
r20-23  1061de40 1034aa00 1034a980 1061de40
r24-27  1061de50 00001000 00000000 1027e010
r28-31  00000000 00000000 1bb40780 1012de88
sr0-3   00000000 00000000 00000000 00000153
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 00000000 00000004
 IIR: 00000000    ISR: 00000000  IOR: 00000008
 CPU:        0   CR30: 1bb40000 CR31: 102f8000
 ORIG_R28: 00000000

//------------------------------------

Does anyone know what that means?
Any experiences?
Does anyone have a modem running on a parisc-box?

Hinrich.
