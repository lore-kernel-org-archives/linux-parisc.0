Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA08650
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 21:16:01 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id UAA10422
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Jan 2001 20:19:19 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Reply-To: law@redhat.com
In-reply-to: Your message of Wed, 03 Jan 2001 15:11:33 +1100.
             <Pine.LNX.4.21.0101031509470.24351-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Jan 2001 21:15:51 -0700
Message-ID: <2276.978495351@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0101031509470.24351-100000@front.linuxcare.com.au>y
ou write:
  > Ah, but that's where the automagic linker search for libmilli come into
  > play.  Effectively, libmilli is always mentioned on the "command line"
Does this automagic search also happen when you build shared libraries?

[ Yes, I'm very familiar with HP's automagic searching for libmilli.a.  I also
  think it's a terrible mistake as a design decision. ]

jeff
