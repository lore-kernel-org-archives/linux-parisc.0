Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA22397
	for <parisc-linux@puffin.external.hp.com>; Mon, 3 Apr 2000 03:54:45 -0600
From: BOSCHINI@ICIL64.CILEA.IT
Date: Mon, 03 Apr 2000 11:54:05 +0000 (MET-01DST)
To: PARISC-LINUX@THEPUFFINGROUP.COM
Cc: BOSCHINI@cilea.it
Message-id: <01JNSQTRUTAQ0010PS@ICIL64.CILEA.IT>
MIME-version: 1.0
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Subject: [parisc-linux] kernel make oldconfig error on HP-735 10.20

Hi all, 

here I am again with my dumb questions: 
I finally (thanks to your help) succeeded in making and isntalling binutils and
gcc.

I gzcat'ed and tar x'ed linux-latest, but when I try a 

make oldconfig 

I get 

Make: line 9: syntax error.  Stop.


where line 9, as well as the rest of the makeifle, looks fine to me....

>From the README, it looks like I need bash, which I then installed, and set in
$BASH, but I still get the same error: any clues ?

thanks in advance, 

Matteo Boschini
