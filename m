Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA29077
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 09:25:57 -0600
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199906101526.IAA04509@chrome.rose.hp.com>
Subject: Re: [parisc-linux] booting problems
To: adevries@thepuffingroup.com (Alex deVries)
Date: Thu, 10 Jun 1999 8:26:45 PDT
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <375F6778.7E2F1385@thepuffingroup.com>; from "Alex deVries" at Jun 10, 99 3:21 am
List-ID: <linux-parisc.vger.kernel.org>

| 
| No, we don't have remote manatement cards, but it sounds like they'd be
| very useful for this kind of thing.  I know the LCD panels on the D270
| displays these, is this a similiar device?
| 

Yes, the LCD panel and the display on the 25th line of the HPTERM both
display the chassis codes sent by the PDC_CHASSIS call. The remote
management card, however, has the benefits of saving a history of the
chassis codes, as well as providing the remote reset/TOC functions. 

| > cards over a dedicated hardware interface, and so inserting them into
| > your code gives a very low level way to display debug data.
| 
| Putting the error on the 25th line is a really good idea, but I can't
| see the 25th line because of the terminal control buttons ("Line
| Modify", "Modify All", etc).  I can't seem to get rid of them either.
| What's the trick?

For the X11 hpterm client on an HP-style keyboard, hitting the Menu key
will cause the softkey labels to be toggled on/off.  On a PC-style
keyboard, the PrintScreen/SysRq key toggles the labels. If you have a
remote management card, then the chassis codes will automatically toggle
thte softkey labels off. 

KMB

--
+============================================================+
|       Kirk Bresniker    	(916) 785-5677		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
