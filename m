Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA19258
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 16:35:55 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199911172337.PAA14420@opus.allegro.com>
Subject: Re: [parisc-linux] depi?
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Wed, 17 Nov 1999 15:37:29 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991117235220.E10209@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 17, 1999 11:52:20 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> > 0xc0015538 <pdc_console_init+88>:       ldil -3ff72800,r1
> > 0xc001553c <pdc_console_init+92>:       be,n 3c0(sr7,r1)
> > 
> > I can't find where sr7 is initialized.
> 
> It isn't, we don't need to.   This branches to
> -0x3ff72800 + 0x3c0 = 0xc008dbc0.

I must be missing something...the above should branch
to: sr7.0xc008dbc0, not to "0xc008dbc0".  I.e., you specified SR7
in the BE instruction, so it gets used.  

Of course, if you'd said:  
   BE,N 3c0(0,r1) 
the result would effectively be the same (because it's a short
address, we grab the upper two bits of $c008dbc0, add 4, and therefore
use SR7 as the space register).

So, SR7 indeed needs to be set correctly...but since I haven't
looked at the surrounding code...

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
