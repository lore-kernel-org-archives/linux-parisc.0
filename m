Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA16739
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 22:37:22 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 17 Jan 2001 05:41:04 -0000
Received: from hse-ottawa-ppp157453.sympatico.ca (HELO linuxcare.com) (adevries@64.229.130.124)
  by smtp.linuxcare.com with SMTP; 17 Jan 2001 05:41:06 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A65319E.5B312160@linuxcare.com>
Date: Wed, 17 Jan 2001 00:46:06 -0500
From: Alex deVries <alex@linuxcare.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: Matthieu Delahaye <delahaym@esiee.fr>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Lasi harmony driver with mixer
References: <3A64D26B.B99BAE70@esiee.fr> <20010116231823.K20275@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> afair, prumpf had his harmony driver working on the 715/scorpio.  perhaps
> by looking at his source you could see what is missing?

I started harmony.c with the latest version of prumpf's driver, which
really didn't do anything at all.  I checked every tree I could find
(including his trees on sourceforge),
but the only one I found may have at one point played a hard coded
file.  There's not a lot left of it in my driver.  I definitely couldn't
get it to work on a 712, let alone a 715/old.

The audio HPA on the 715/old is way out of bounds for it to be a part of
Lasi or ASP, so it looks like another audio chip.  It doesn't have the
right ID register, and doesn't respond to any setup attempts.

Matthieu, it's good to hear about the gain control patches.  Now go sort
out the 16 bit audio format problem! :)

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
