Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server01 (s217-115-138-231.colo.hosteurope.de [217.115.138.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41D59482A
	for <parisc-linux@parisc-linux.org>; Wed, 31 Jul 2002 00:56:44 -0600 (MDT)
From: j.steindlberger@gmx.net
To: parisc-linux@parisc-linux.org
Date: Tue, 30 Jul 2002 11:21:30 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <20020731065644.41D59482A@dsl2.external.hp.com>
Subject: [parisc-linux] IEEE1394 (Firewire iLink) - any ideas to build modules
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

did anyone succeed in building modules for an OHCI1394 card? I think the 
problem is a general leck in DMA support. As I'm not a kernel specialist I 
don't have any idea.
When trying to build a module there are dependency problems. When trying to 
build into the kernel there are missing some functions for DMA - I think.

Regards
Joerg

PS:
( System: HP9000 C360 )
  Bus  0, device   3, function  0:
    FireWire (IEEE 1394): PCI device 104c:8020 (Texas Instruments) (rev 0).
      IRQ 99.
      Master Capable.  Latency=255.  Min Gnt=3.Max Lat=4.
      Non-prefetchable 32 bit memory at 0xf2ff8000 [0xf2ff87ff].
      Non-prefetchable 32 bit memory at 0xf2ffc000 [0xf2ffffff].
