Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA25239
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 08:54:58 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 22 Dec 2000 15:57:59 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 22 Dec 2000 15:58:00 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A437AC4.EA5BC34B@linuxcare.com>
Date: Fri, 22 Dec 2000 11:01:08 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: Helge Deller <deller@gmx.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] configuration problems with cvs from 20001216 15:40
 CET
References: <20001217115105.A17378@excalibur.cologne.de> <00121721201800.25726@P100> <20001218230325.A934@excalibur.cologne.de> <00122000445401.00303@P100> <20001221233934.A766@excalibur.cologne.de> <20001222133020.A17200@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Thu, Dec 21, 2000 at 11:39:34PM +0100, Karsten Merker wrote:
> > It seems the "console=ttyS0" is the reason for the crash. To be sure, I
> > have taken a fresh kernel tree (checkout from today) and compiled the
> > kernel with the default configuration. It worked...
> 
> specifying `console=ttyS0' before the checkin i recently did would
> definitely have caused exactly that crash.  it was trying to do an outb
> because the serial driver wasn't properly configured.  since no 715 has
> PCI, outb crashed & burned.

Has that been fixed now?  Should serial on a 715/old work?  

(Also, you can have a 715 with a PCI bus if you have a GSC add on card)

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
