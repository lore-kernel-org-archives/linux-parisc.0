Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA26833
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 14:10:28 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id LAA17683
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 11:08:30 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8T16A00.D0T for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar
          1999 11:08:34 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F14F9B.AD1968C3@netscape.com>
Date: Thu, 18 Mar 1999 14:10:19 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] memory layout
References: <m10NZyO-0007U2C@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> If you want to run PH/UX binaries then you need to probably follow their
> layout

Yeah, but OpenBSD runs their binaries and seems to use the 0xC0000000
division.

> The m68k people use the 'spaces' equivalent on the m68k quite heavily

So we should be reading up on the spaces use in the arch/m68k code, then
=).

Mike

-- 
351839.03 300276.13
