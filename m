Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA04473
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 21:48:40 -0600
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: adevries@thepuffingroup.com, jason@equator.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 11 Jun 1999 23:23:50 EDT.
             <199906120323.XAA29685@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 11 Jun 1999 21:43:33 -0600
Message-ID: <21640.929159013@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <199906120323.XAA29685@hiauly1.hia.nrc.ca>you write:
  > image.  Finally, the .PARISC.unwind and .PARISC.symext must be
  > loaded to the correct locations in the LIF image.
You can throw away the unwind & symext sections.  While one day you might want
the unwinders in your lif image, you'll never want the symext.

In the ELF tools, you shouldn't never end up with anything in $CODE$.  If
you do, that's a bug in either the compiler or the assembler.  It should
have mapped $CODE$ into .text.

jeff
