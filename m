Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.linuxcare.com (unknown [216.88.157.131])
	by dsl2.external.hp.com (Postfix) with SMTP id F1D9A4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 16:27:50 -0700 (MST)
Received: from linuxgate.linuxcare.com (HELO linuxcare.com) (167.216.157.206)
  by smtp.linuxcare.com with SMTP; 20 Feb 2001 23:27:54 -0000
Sender: adevries@dsl2.external.hp.com
Message-ID: <3A92FF66.BB9B30C@linuxcare.com>
Date: Tue, 20 Feb 2001 18:36:06 -0500
From: Alex deVries <alex@linuxcare.com>
MIME-Version: 1.0
To: n.wies@wanadoo.fr
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help wanted on an 715/50 "old Box" 2
References: <01022023263600.01386@nw>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

WIES Nicolas wrote:
> I have an old Apollo, a 715/50 Scorpio with 64Mb Ram and a Tulip in the EISA
> port and my goal is to turn it into a firewall.

It seems very unlikely that's a Tulip chip, since that's a PCI chipset
that can't connect to EISA.  If it's another EISA ethernet chipset,
there's still some WAX work we need to get through.

> But I never have a commplete boot.
> 
> >From the beginnig of the year, I don't remenber exactly when, I have the same
> message with this last lines:
> 
> Entry 00100170 first 00100000 n 5
> 
> Segment 0 load 00100000 size 1453916 mediaptr 0x1000
> Segment 1 load 00264000 size 201128 mediaptr 0x164000
> Segment 2 load 00298000 size 214428 mediaptr 0x196000
> Segment 3 load 002d0000 size 8192 mediaptr 0x1cb000
> Segment 4 load 002fbda8 size 71328 mediaptr 0x1cdda8
> branching to kernel entry point 0x00100170
> 
> And nothing happen.

I've had this too with the exact same machine (without the EISA ethernet
card).  Then I decided to leave it for a LONG time, like 5 minutes, and
it did boot.  Could you try leaving it for something like an hour to see
if you get anything on the console?

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Putting open source to work.
