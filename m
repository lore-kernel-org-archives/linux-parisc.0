Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA08908
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 15:21:35 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 23 Dec 2000 22:24:40 -0000
Received: from hse-ottawa-ppp156830.sympatico.ca (HELO linuxcare.com) (adevries@64.229.128.9)
  by smtp.linuxcare.com with SMTP; 23 Dec 2000 22:24:40 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A4526E3.814E8746@linuxcare.com>
Date: Sat, 23 Dec 2000 17:27:47 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Some questions about the 715/50
References: <3A44E560.BE825C97@linuxcare.com> <20001223194702.A824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Sat, Dec 23, 2000 at 12:48:16PM -0500, Alex deVries wrote:
> > Scorpio's a 715/old, and has two IO chips in it: WAX and Lasi. Scorpio
> > Jr. (715/33) and Scorpio Sr. (715/75) are identical.
> 
> uh, no, it has Wax and Asp.  Lasi was a later chip.  It's very similar to
> Lasi though.

I actually meant to type ASP, but the letters L-A-S-I came out of my
fingers.


> > My questions:
> > a. The docs say that WAX's HIL on a GSC (not GSC+) is at 0xf0201000, but
> > the HIL reported above is clearly in the ASP range.  Is there actually a
> > HIL controller on ASP? More importantly, how are the interrupts routed?
> The HIL controller is definitely on Asp.  The interrupt `just worked'
> when i first stole phil blundell's hil driver he'd written for the hp300.

So that's interesting... the LASI ERS says nothing about there being a
HIL controller, so the HIL controller must have been dropped in the
ASP->Lasi transition.

So here's the keyboard and serial situation on older machines:

Model               IO Chips      Keyboard       Serial
==========================================================
712     Gecko       Lasi          PS/2 on Lasi   1 on Lasi
715/old Scorpio     ASP, Wax      HIL on ASP     2 on ASP
725     Spectra     ASP, Wax      HIL on ASP     2 on ASP
715/new Mirage      Lasi, Wax     HIL on Wax     1 on Lasi, 1 on Wax

I'm not sure how much Wax stuff is actually running for HIL or Serial.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
