Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jumpgate.home.net.au (c16844.fernt1.vic.optusnet.com.au [210.49.203.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEADD4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jun 2003 06:58:08 -0600 (MDT)
Message-ID: <3EF99C53.7070200@optusnet.com.au>
Date: Wed, 25 Jun 2003 12:57:55 +0000
From: Rod Smart <snaketails@optusnet.com.au>
MIME-Version: 1.0
To: gentoo-user@gentoo.org,
	PA-RISC Users <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Getting XF86 to run on a C-180 box
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

    Hello.

    I have a C-180 Visualize RISC system with a (GSC) "A4070" video card 
with a "A4747" daughter card.

    The system is happily running with Gentoo Linux, and the swap space 
hasn't even been touched...

    I would like to get this thing into doing something more than 
heating my bedroom, so I am wondering if anyone has a XF86Config file 
that I could get the video driver settings for the above card configuration.

    I have tried "fbdev" but even at Depth=8 I have not been able to get 
xfree running.

    I searched through the old mail archives but I couldn't find much 
more than the "fbdev" setup.

    When I do the  command line from one of the mail list messages i get 
the following.

vorlon portage # dmesg | grep stifb
fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf8100000
fb1: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio: 0xfa100000

    I'm not sure what this means, but I think the "-8" and the "-32" is 
the depth.

    The system RAM is fully populated with 768Megs

    If you require any more information, please just ask ;o)
