Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA28108
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 16:07:22 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 22 Dec 2000 23:10:25 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149bKA-0004vV-00; Fri, 22 Dec 2000 23:10:06 +0000
Date: Fri, 22 Dec 2000 23:10:06 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alex deVries <adevries@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Helge Deller <deller@gmx.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] configuration problems with cvs from 20001216 15:40 CET
Message-ID: <20001222231006.A17996@parcelfarce.linux.theplanet.co.uk>
References: <20001217115105.A17378@excalibur.cologne.de> <00121721201800.25726@P100> <20001218230325.A934@excalibur.cologne.de> <00122000445401.00303@P100> <20001221233934.A766@excalibur.cologne.de> <20001222133020.A17200@parcelfarce.linux.theplanet.co.uk> <3A437AC4.EA5BC34B@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A437AC4.EA5BC34B@linuxcare.com>; from adevries@linuxcare.com on Fri, Dec 22, 2000 at 11:01:08AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 22, 2000 at 11:01:08AM -0500, Alex deVries wrote:
> > specifying `console=ttyS0' before the checkin i recently did would
> > definitely have caused exactly that crash.  it was trying to do an outb
> > because the serial driver wasn't properly configured.  since no 715 has
> > PCI, outb crashed & burned.
> 
> Has that been fixed now?  Should serial on a 715/old work?  

Serial always worked, as did serial console.  Only if you specified
`console=ttyS0' would the Bad Things happen, because the serial console
didn't do a proper initialisation, it just hoped.  Now, the serial console
initialisation is done after the serial driver starts up, so all the
initialisation is done properly first.

> (Also, you can have a 715 with a PCI bus if you have a GSC add on card)

true... though i've never seen one.

-- 
Revolutions do not require corporate support.
