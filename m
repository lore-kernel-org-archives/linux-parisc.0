Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA07416
	for <parisc-linux@puffin.external.hp.com>; Sat, 1 Apr 2000 10:53:29 -0700
Message-Id: <200004011755.JAA28068@milano.cup.hp.com>
To: Mike Brancato <funnyguy@digitalsmackdown.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735/125 boot problem? 
In-reply-to: Your message of "Sat, 01 Apr 2000 03:42:36 PST."
             <Pine.LNX.4.10.10004010340190.1371-100000@morph.net>
Date: Sat, 01 Apr 2000 09:55:52 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Mike Brancato wrote:
> we have another 735 here, and like, if i leave th HD connected, it shows
> HPUX trying to start, but just sits at the screen with the yellow displays
> at teh bottom.

Mike,
Have you tried connecting to the serial port? (9600, 8, N, 1)

The console might be directed to the serial port and nothing
will show up on the monitor until X11 is started. I think the
yellow boxes at the bottom are an artifact from the graphics
firmware support for function keys.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
