Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0164482A
	for <parisc-linux@parisc-linux.org>; Fri,  1 Feb 2002 12:54:01 -0700 (MST)
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id NAA25502
	for <parisc-linux@parisc-linux.org>; Fri, 1 Feb 2002 13:53:52 -0600
Date: Fri, 1 Feb 2002 13:53:52 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.21.0202011318340.23933-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Display for C100?
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

Gentlemen,

When I bought my C100 about a year ago the sales critter claimed the
graphics card could drive a run of the mill monitor.  It has a standard
SVGA connector.  I've hooked up a couple of displays to no avail.  Here's
what seem to be the relevant kernel boot messages:

[...]
18. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4, 0x0, 0x77
[...]
36. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4, 0x0, 0x77
[...]
STI byte mode ROM at f6000000, hpa=f6000000
STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf6100000

Would anyone know what kind of monitor I need?

Regards,

- Greg
