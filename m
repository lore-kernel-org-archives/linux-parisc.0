Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA11210
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 18:22:10 -0700
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id UAA28830
	for <parisc-linux@thepuffingroup.com>; Sun, 14 Nov 1999 20:22:45 -0500 (EST)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id RAA11776 for <parisc-linux@thepuffingroup.com>; Sun, 14 Nov 1999 17:23:46 -0800 (PST)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id RAA01444 for parisc-linux@thepuffingroup.com; Sun, 14 Nov 1999 17:23:36 -0800 (PST)
Message-Id: <199911150123.RAA01444@meow.sr.hp.com>
Subject: Re: [parisc-linux] 715 useful (fwd)
To: parisc-linux@thepuffingroup.com
Date: Sun, 14 Nov 1999 17:23:36 -0800 (PST)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
Reply-To: bkatz@agilent.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


From: Alex deVries <adevries@thepuffingroup.com>
|On Sat, 13 Nov 1999, Matthew Wilcox wrote:
|> For the machines which have ASP, am I right in saying they have no other
|> sources of interrupts?  ie what I want to do is:
|
|I'm interpretting this question as:
|
|"For machines which have ASP, am I right in saying that no other IO
|devices apart from ASP generate interrupts to the CPU?"
|
|I think the answer to that question is no, because:
|- they have GSC slots, so you could have a card mode lasi or dino device
|- doesn't WAX have it's own interrupts?

Remember, ASP only exists on boxes that use the VSC/SGC I/O bus, i.e.
boxes that are pre-GSC.  Pre-GSC boxes will never have GSC slots,
or WAX, or Zalon.

The only expansion slots these boxes have are EISA, and EISA interrupts
come through ASP.

I learned a little more about these boxes friday.  The memory controller
in early 715s (/33, /50, /75) is called spider.  SPider actually 
sends the bus transaction to the processor to interrupt it.  It 
can interrupt the processor for any of its own reasons (memory
error, bus timeout, etc.)  It has one external interrupt pin, and
that is hooked to ASP.  I also did a quick scan through the docs
for the viper meomry controller used in 720/730/750, and it has one
external interrupt pin, so I think the assumption that all I/O 
interrupts come through ASP is valid.

Unfortunately spider was designed by the ex-Apollo floks in CHelmsford,
who basiclaly all left the company when R&D was consolidated in
Ft. COllins.  SO I have no good sources for an ERS for the spider chip.

	-Bill Katz
