Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.cirr.com (ntp-b.cirr.com [192.67.63.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84567482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 31 Jul 2001 16:07:08 -0600 (MDT)
Message-Id: <200107312206.RAA20934@opus.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: "Anthony Mori" <tonym@compusource.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 problem 
In-reply-to: Your message of "Mon, 30 Jul 2001 23:48:31 EDT."
             <004b01c11973$ada28fd0$0b1e7b01@tpburner>
Date: Tue, 31 Jul 2001 17:06:50 -0500
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>

"Anthony Mori" writes:
- Before I changed the Fastboot, When the machine was turned on,
- LED's 2,3,4 were on briefly, then they went out, and LED 1 stayed on.
- Then after a briedf pause, 2,3,4 would start flickering as if it was doing
- something (which it was).
- 
- Now, 2,3,4 turn on briefly, then go out, and LED 1 turns on, and that's
- it. Nothing else. No video, nothing (A4071B video card)

	Which LED is `1'?  (whats the lab beside it?)

	According to the C Class (c1x0, c2x0, c3x0) service
handbook, 'net-in' (top or right) LED lit, with no others means
`no memory found.' (with a further comment of ``Likely cause:
SIMMs or processor board'').

	There is fault that leaves the hearbeat LED lit (at
least, not according to the documentation.) The SCSI access LED
lit means ``Processor board fault'' (my C110 currently suffers
this.)

--
Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
	There has been an alarming increase in the number of things
			    you know nothing about.
