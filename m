Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA06132
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Oct 1999 13:24:44 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA25126
	for <parisc-linux@thepuffingroup.com>; Wed, 20 Oct 1999 13:25:33 -0600 (MDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id MAA24899 for <parisc-linux@thepuffingroup.com>; Wed, 20 Oct 1999 12:25:22 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id MAA19900 for parisc-linux@thepuffingroup.com; Wed, 20 Oct 1999 12:25:25 -0700 (PDT)
Message-Id: <199910201925.MAA19900@meow.sr.hp.com>
Subject: Re:  [parisc-linux] a WAX question.
To: parisc-linux@thepuffingroup.com
Date: Wed, 20 Oct 1999 12:25:25 -0700 (PDT)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|> Date: Wed, 20 Oct 1999 01:02:52 -0400 (EDT)
|> From: Alex deVries <adevries@thepuffingroup.com>
|> To: parisc-linux@thepuffingroup.com
|> Subject: [parisc-linux] a WAX question.
|> 
|> ...
|> Something that comes up quite a bit in those entries is WAX.  Is there
|> actually a serial port on the WAX chip?  What can people tell me about
|> this chip?
|> 
|
|WAX provides one rs232 port (compatible with NS16550A), HIL, HP-IB and
|an "EISA converter."  I know it appears on the 712s, {715,725}/{80,100}
|and J210 at the very least.  Doc that we have:

Wax does have an RS232 port.  It uses the same Megacell as LASI, which
is basically a 16C550.

712s do NOT contain Wax, and have only 1 RS232 port.

Wax provides the second RS232 port, as well as HIL and EISA in 715s,
725s, J200s, J210s, and pretty much any box that has EISA slots.
(Including C110s).  The HPIB support in Wax was never used in a product.

(I used it in a HP internal board, and found I was the first.)

The HIL in WAX is an integration of the HIL chip that was used in 
earlier (pre-PS2) workstations such as 720, 730, 735, early 715s.

It also contains some real-time timers that were originally in another ASIC
in the 742 (50 MHZ, PA7100) VME computer board.  I believe these timers
are also in the TIMI GSC -> VME chip, so they were probably never used
in WAX either.

|
|	External Reference Specification for the Wax I/O ASIC
|	(aka, the Wax ASIC ERS)
|	Rev 1.2, October 7, 1993
|	Dwg. No. A-1FT4-9002-1

THis is also what I have.
|
|There is basic support for it in the Mach sources.

	-Bill
