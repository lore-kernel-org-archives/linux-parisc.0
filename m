Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk
	(cpc1-cwma1-5-0-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 499994843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 25 Feb 2004 18:12:59 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i1Q18s0r026589; Thu, 26 Feb 2004 01:08:55 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i1Q18pLu026587; Thu, 26 Feb 2004 01:08:51 GMT
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "M. Grabert" <xam@cs.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
Content-Type: text/plain
Message-Id: <1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Thu, 26 Feb 2004 01:08:48 +0000
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Iau, 2004-02-26 at 00:52, M. Grabert wrote:
> It occurs to me that the driver has some big endian issues (and probably
> some other issues aswell). I've given up hope to get it working after
> I didn't receive any replies from the maintainer, linux-ide or even lkml.

Well as the older maintainer I certainly didnt get anything. The core 
code is known to be good for 64bit and also big endian, the mmio IDE
code is a little less tested so you could try running the 680 in I/O
mapped mode as a first guess. Otherwise it should be clean.

> - I get LOTS of "hda: lost interrupt messages"
> 
> - trying to access the hda is slow or hangs the process trying to access
>   the IDE hard disk (and results in issuing the above mentioned messages)
> 
> - the hard disk is eventually detected correctly on boot up
>   (but it takes long time - minutes - and many "hda: lost interrupt" messages)
> 
> - fdisk shows the correct information about the partitions
> 
> - using "ide=nodma", "hda=nodma" and "nodma" as kernel options doesn't
>   make any difference.

Your IRQ routing is probably wrong. However this is a gotcha with
promise controllers. Some of them require the x86 boot firmware is run
before they operate.

> One very interesting thing is that the "hda: lost interrupt" messages
> also appeared when I tried the siimage IDE controller on 2.4 kernels!
> (see http://www.cs.ucc.ie/~xam/siimage/bootlog-2.4.23-pa3.txt)
> Perhaps the siimage problem might be related to this problem?
> 
> Any suggestions what could be the problem or how to debug it any further?

First stop sounds like figuring out what IRQ routing is being used. In
particular you need to know how legacy mode interrupt mapping is done on
your system and whether it is even wired that way. If its using native
mode you then need to work out why your IRQ is not appearing (or which
IRQ is actually correct).

(IDE chips have two modes - some more but the basic ones are

legacy mode: decodes the traditional PC IDE I/O ports, uses ISA IRQs
which can be fun since motherboard IDE may point them anywhere or not
wire them.

native mode: Uses PCI irq signalling and addressing. Used for plug in
cards but doesn't always work on motherboard devices.
)
