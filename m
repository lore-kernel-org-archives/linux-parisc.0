Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx04.nexgo.de (mx04.nexgo.de [151.189.8.80])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16608482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Nov 2001 03:57:18 -0700 (MST)
Received: from hrzpub.tu-darmstadt.de (dialin-145-254-200-200.arcor-ip.net [145.254.200.200])
	by mx04.nexgo.de (Postfix) with ESMTP id C790C37B8A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Nov 2001 11:57:14 +0100 (CET)
Message-ID: <3BEE59B7.4080108@hrzpub.tu-darmstadt.de>
Date: Sun, 11 Nov 2001 11:57:59 +0100
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] Keyboard problems and StiFB
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

Hi there!

At first I want to say thanks to all the people, who made the great 
improvements on the kernel!! Now even my 715/100 with its second 
graphics card is running a stifb. ;-) And X-Server is running with 
1280x1024 with 24bpp... (That's cool...)

But now I have some trouble with my keyboard. I use a ps/2-keyboard and 
-mouse with HIL-Adaptorbox. If I do a cold boot the kernel finds a 
HIL-Keyboard, loads a keymap and  at the login the keyboard has a weird 
behaviour. ( Pressing enter e.g. gets me to the MagicKey-Menu). When 
rebooting the machine the kernel now didn't found any HIL-Keyboard, says 
s.th. about "device not claimed" , but the keyboard now works. The 
PS/2-Mouse works always.
Any Solution ?
And there's another question: How do I change between the first stifb 
and the second stifb? Console always opens on my second graphics card 
(HCRX24), but due to the resolution of 1280x1024 everything is quite 
small, so I would like use the builtin graphics.

Thanks in advance,

        Rüdiger
