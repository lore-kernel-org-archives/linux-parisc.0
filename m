Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA01816
	for <hppa-linux@sod.res.cmu.edu>; Wed, 24 Mar 1999 16:16:58 -0500
Received: (from jason@localhost)
	by gatekeeper.equator.com (8.9.1a/8.9.1) id NAA25002
	for hppa-linux@thepuffingroup.com; Wed, 24 Mar 1999 13:16:48 -0800 (PST)
Date: Wed, 24 Mar 1999 13:16:48 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903242116.NAA25002@gatekeeper.equator.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Linux Kernel and PA-RISC
List-ID: <linux-parisc.vger.kernel.org>


>
>
> My understanding of PA equivalent:
>
 ...
> 	
> 	One other question is whats happening to space registers when
> 	you are running in real mode ?
>

  In real mode the space register field of the load/store/cache instructions
  is ignored so that the effective address is just the 32-bit offset.

  Jason.
