Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id TAA06303
	for <hppa-linux@sod.res.cmu.edu>; Wed, 24 Mar 1999 19:56:36 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id QAA14773
	for <hppa-linux@thepuffingroup.com>; Wed, 24 Mar 1999 16:55:48 -0800 (PST)
Received: from netscape.com ([205.217.243.139]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F94L9600.B78 for <hppa-linux@thepuffingroup.com>; Wed, 24 Mar
          1999 16:55:54 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FA3FC2.D82F6BCE@netscape.com>
Date: Thu, 25 Mar 1999 08:53:06 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] the cvs thingy
References: <199903242116.NAA25002@gatekeeper.equator.com> <36F98997.130DE72A@america.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ed June wrote:
> $ cvs -z3 checkout hppa-linux
> cvs server: cannot find module `hppa-linux' - ignored
> cvs [checkout aborted]: cannot expand modules

cvs -z3 co linux

Mike

-- 
9805.70 8095.76
