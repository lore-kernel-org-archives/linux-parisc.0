Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA29944
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Oct 1999 17:22:56 -0600
Received: from arctic (hamster@arctic [129.138.40.17])
	by arctic.nmt.edu (8.8.7/8.8.7) with ESMTP id RAA21557
	for <parisc-linux@thepuffingroup.com>; Tue, 5 Oct 1999 17:23:36 -0600
Date: Tue, 5 Oct 1999 17:23:36 -0600 (MDT)
From: Steve Ball <hamster@arctic.nmt.edu>
cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199910050731.JAA12199@seger.axis.se>
Message-ID: <Pine.LNX.4.04.9910051713170.18798-100000@arctic>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Out of the loop....
List-ID: <linux-parisc.vger.kernel.org>


Wheeee so its been a while since i've done any work on these HP machines
here.. I tried unsucessfully to boot a kernel back in July, and today I
decided to try it again.  Put rbootd on my linux box, and booted the 09-30
image I got from puffin on my system.

Its an HP apollo Series 700, which boils down to a model 730 (King
Cobra) 66mhz machine with 64 megs of mem.

The bootloader seems to boot ok, it hangs at transferring control to the
kernel, entry point 0x00010000 (earlier versions of the kernel made it all
the way to the rotating cursor) and I get a hex A7 on the LED
indicators...

Anyway, hoping maybe this will help someone!  I'm more than happy to try
anything out on these machines as they are doing absolutly nothing right
now but sitting here.

Have fun! 

----------------------******-------------------
Steve Ball
NMT EE Department System and Network Admistrator

C/S 3392	  	 |	Remember,
Socorro, NM 87801	 |	amateurs built the ark.
hamster@arctic.nmt.edu	 |      Professionals built the
www.ee.nmt.edu/~hamster	 |	Titanic.

'64 Wag 230 OHC/27-4.10/44-4.09/20/T-90/4dr/4wd
"Water covers 75% of the earth.... Jeeps cover the rest."
----------------------******-------------------
