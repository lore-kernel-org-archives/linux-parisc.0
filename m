Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07852
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 14:24:45 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 23 Dec 2000 21:27:50 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149wCi-00022J-00; Sat, 23 Dec 2000 21:27:48 +0000
Date: Sat, 23 Dec 2000 21:27:48 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Jens Trzaska <j_trzaska@gmx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] starting 712/80 without keyboard?
Message-ID: <20001223212748.A7769@parcelfarce.linux.theplanet.co.uk>
References: <3A44F763.2CB637F9@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A44F763.2CB637F9@gmx.net>; from j_trzaska@gmx.net on Sat, Dec 23, 2000 at 08:05:07PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 23, 2000 at 08:05:07PM +0100, Jens Trzaska wrote:
> Hello again!
> Does anyone know if there is a possibility to start a hp 712/80 
> without a keyboard plugged in? I cannot find an option in the
> bootrom. It always says: 
> 	"Failed to initialize a keyboard, SYSTEM HALTED" 

another thing which should be in the faq, but isn't.

serial console on the 712 is officially Not Supported.

however, you can do it, if you know what to type.  full details are in
the mailing list archives somewhere.

-- 
Revolutions do not require corporate support.
