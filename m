Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA09787
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jan 2000 20:29:43 -0700
Message-Id: <200001080332.VAA25531@opus.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: micha28@gmx.de
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 9000/712 & Samsung Monitor 
In-reply-to: Your message of "Sat, 08 Jan 2000 03:15:37 +0100."
             <20000108031537.A2522@gonzo.ns03.de.uu.net>
Date: Fri, 07 Jan 2000 21:32:36 -0600
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>


Michael Schulz writes:
- I can get a 712/60 almost complete, but without a monitor.
- So my question is, is it possible to connect a Samsung
- Syncmaster 17GLsi with the HP.
- Specs:
-   Horiz: 30kHz to 85kHz
-   Vert: 50Hz to 120Hz
-   Max. Res. 1280 x 1024
-   Pix Clk: 135MHz

	It should work..  The 712 will detect that the monitor
cannot support a given frequency, and start cycling through the
valid settings.  When you can see one you like, I believe you
press space or enter, and it is selected..

--
Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
      Where subtlety fails us we must simply make do with cream pies.
