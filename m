Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA04371
	for <parisc-linux@sod.res.cmu.edu>; Mon, 29 Mar 1999 16:50:56 -0500
Received: (from sieler@localhost)
	by bart.allegro.com (8.9.1/8.9.1) id NAA30430
	for hppa-linux@thepuffingroup.com; Mon, 29 Mar 1999 13:50:44 -0800
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199903292150.NAA30430@bart.allegro.com>
Subject: Re: [hppa-linux] syscall work 
To: hppa-linux@thepuffingroup.com
Date: Mon, 29 Mar 1999 13:50:43 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi,

> okie, but why emulating gate instruction, when there is already such
> instruction exist? (;

Simple: HP does this...there must be a reason.

They appear to do it on selected models of PA-RISC systems.  Why?  Don't know.

I can only conjecture...and the conjecture is the obvious one: there must be
some circumstance where GATE fails.  Otherwise, *why* replace it with
a slightly slower mechanism?

-- 
Stan Sieler                                          sieler@allegro.com
                                     http://www.allegro.com/sieler.html
