Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA19757
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 09:16:26 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id IAA25568
	for <parisc-linux@thepuffingroup.com>; Fri, 16 Jul 1999 08:16:56 -0700 (PDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id IAA24617 for <parisc-linux@thepuffingroup.com>; Fri, 16 Jul 1999 08:15:50 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id IAA21533 for parisc-linux@thepuffingroup.com; Fri, 16 Jul 1999 08:16:51 -0700 (PDT)
Message-Id: <199907161516.IAA21533@meow.sr.hp.com>
Subject: Re: [parisc-linux] 715/33 experience and one question (fwd)
To: parisc-linux@thepuffingroup.com
Date: Fri, 16 Jul 1999 08:16:51 -0700 (PDT)
From: Bill Katz <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|Right, the 715 has neither DINO nor LASI.  The chips inside are labelled
|OLIN and SHINKO.  http://www.thepuffingroup.com/parisc/hp9000_models.html
|has no details on these chips.  Alex tells me he's trying to get
|documentation on these chips, but I'll have to be patient.  The major
|stumbling block with these machines is likely to be the SCSI controller
|-- it's an NCR53C700 which is apparently a very nasty device; much more
|nasty than the 710 which is built into LASI.
|
|In my copious spare time, I'm stumbling through the Utah Mach sources,
|trying to glean details about OLIN and SHINKO but I've had no success
|so far.

Whoops.  My previous comments about ASP apply to the even earlier
machines (720/730/735).  I also didn't know about the differences
between 5sC700 and 53C710.

I'm sure we've got this data stashed away SOMEWHERE...

	-Bill
