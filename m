Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18BE1482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 08:22:22 -0700 (MST)
Received: from old@istop (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with SMTP id DDD2917069
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 10:23:38 -0500 (EST)
Message-Id: <3.0.5.32.20011115102200.018fcb10@mail.magma.ca>
Date: Thu, 15 Nov 2001 10:22:00 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] HPMC on C200 and FX4 question
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

In message * of Vol 1 #372, Jurriaan asks if anyone has tried a copy on
FWSCSI in a C200.
I just got mine up with FWSCSI and tried the same copy - no HPMC.
Now, this is 2.4.9pa79, nor one of the 2.4.14 kernels but it does work!

By the way does anyone know why an FX4 would not be set up. The message is:

Trying PCI STI ROM at f1e00000, PCI hpa at f6000000
I'm not trying to set up the PCI graphic card now... It would freeze your
machine
Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard Company)'

I was given to beleive that sticon worked on an FX4 with 2.4.9pa64 or later!

Regards, Herb
