Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx04.nexgo.de (mx04.nexgo.de [151.189.8.80])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BA0048C1
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 11:11:35 -0600 (MDT)
Message-ID: <3BB8A3FC.7090304@hrzpub.tu-darmstadt.de>
Date: Mon, 01 Oct 2001 19:12:28 +0200
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Additional Address cleanup
References: <20010921104838.A2049@beavis.ybsoft.com> <3BAF13BC.3090302@hrzpub.tu-darmstadt.de> <20010924215918.A23464@beavis.ybsoft.com> <3BB0BFF9.50708@hrzpub.tu-darmstadt.de> <20010925210035.A22586@solo.franken.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Thomas Bogendoerfer wrote:

>
>bug in the sti code. It doesn't use the sti rom from the card, but from
>the onboard sti rom. I've played with my 715/100 with an extra HCRX and
>had the same problem. I've disabled the HCRX by removing the connection
>between mainboard and HCRX, then the kernel from the 0.9.2 crashed after
>starting the init from the install ramdisk (Kernel Fault: Code=15) :-(
>
>Hopefully I'll get some sti hacking done during the upcoming Linux
>Hackermeeting in Oldenburg coming weekend.
>
>Thomas.
>

Hi,

I'm glad i'm not the only one with this problem. And even someone knows 
the solution for the problem. ;-). I also disabled my add-on card the 
same way, and then the sti-stuff worked quite fine. But it would be 
cooler to use the second card, too.
But you already have a patch? I can only help with testing and a little 
bit of debugging as all of my fingers are thumbs ;-)

So long,
        Ruediger
