Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA29468
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 11:08:44 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199906101708.KAA30716@bart.allegro.com>
Subject: Re: [parisc-linux] booting problems
To: kirkb@chrome.rose.hp.com (Kirk Bresniker)
Date: Thu, 10 Jun 1999 10:08:29 -0700 (PDT)
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199906101526.IAA04509@chrome.rose.hp.com> from "Kirk Bresniker" at Jun 10, 99 08:26:45 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:

> | No, we don't have remote manatement cards, but it sounds like they'd be
...
> display the chassis codes sent by the PDC_CHASSIS call. The remote
> management card, however, has the benefits of saving a history of the
> chassis codes, as well as providing the remote reset/TOC functions. 

Do you have a part number for this card?
 
> For the X11 hpterm client on an HP-style keyboard, hitting the Menu key
> will cause the softkey labels to be toggled on/off.  On a PC-style
> keyboard, the PrintScreen/SysRq key toggles the labels. If you have a
> remote management card, then the chassis codes will automatically toggle
> thte softkey labels off. 

On some X-Windows servers on PCs, pressing F9 will toggle the "25th" line
display between not showing and showing the user function keys.
Pressing F11 will display the 25th line, showing the
device/modes function keys.  Pressing F12 will display the 25th line
showing the user function keys.   (At least, that's what Reflection X
is doing for me, connection to HP-UX 10.20 running CDE)

-- 
Stan Sieler                                          sieler@allegro.com
                                     http://www.allegro.com/sieler.html
