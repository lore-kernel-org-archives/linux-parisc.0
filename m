Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA25801
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Feb 2000 13:48:51 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <38A314EE.F0CC5D01@subcarrier.org>
Date: Thu, 10 Feb 2000 14:43:42 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: Dunn RobertE Contr ESC Det 5 /NDSI <Robert.Dunn@CISF.AF.MIL>
CC: "'parisc-linux'" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Metrics Gathering and Quality Measurements
References: <40DBF9A085B2D3118C2600508B6FCB8A41E0FD@cisf7.cisf.af.mil>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Currently the number of active developers is fairly small, so most bug
tracking is done by the developers themselves.  This is working
reasonably right now, since most bugs get fixed quickly and the number
of users of the code is small.

Once we get far enough that userspace applications work, the number of
developers and end users will likely grow quickly.  At that time it will
be important to scale our bug tracking as well.  Bugzilla
(http://bugzilla.mozilla.org/) would be a good bug tracking tool for us
to use.

Bugzilla is pretty slick.  You can report bugs, track progress, set
target fix dates, mark duplicates, etc.  All the data is stored in a
database so you can build interesting queries (such as listing how many
bugs each engineer has assigned to be finished before the next milestone
date).  Mozilla.org/Netscape wrote Bugzilla and they use it for all
their bug tracking -- there are a lot of good techniques we can steal,
er borrow, from them.

	- Mike.

Dunn RobertE Contr ESC Det 5 /NDSI wrote:
> 
>         My primary question is, are there any metrics being gathered on the
> problems that I see reported on the list server?  Are the problems that are
> reported being categorized and counted?  Is there any identification of when
> the problem was introduced, when it was identified, and when it was
> corrected?
