Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51320482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 15:19:21 -0600 (MDT)
Subject: Re: [parisc-linux] Re: Version 0.9 of PA-RISC Linux Released
To: matthew@wil.cx (Matthew Wilcox)
Date: Tue, 5 Jun 2001 22:16:52 +0100 (BST)
Cc: mszick@pflash.com (Michael S. Zick),
	matthew@wil.cx (Matthew Wilcox), debian-hppa@lists.debian.org,
	parisc-linux@parisc-linux.org, parisc-linux@thepuffingroup.com
In-Reply-To: <20010605220735.V7349@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jun 05, 2001 10:07:35 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E157OC4-0007PP-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> On Tue, Jun 05, 2001 at 03:22:20PM -0500, Michael S. Zick wrote:
> > The only way to validate a change as a potential patch is:
> > 1) start with a clean (error and warning free) build that
> > boots and runs on the machine of interest.
> > 2) hack, change, modify, whatever
> > 3) when done, make another clean build that boots and runs
> > on the machine of interest.
> > 4) evaluate the effects of the change(s).
> > 5) If successful - then you MIGHT have something worth
> > submitting as a POTENTIAL patch.
> > Exactly the same 5 steps your developers take before they
> > commit a change to CVS.
> 
> the people with CVS access are hardly `my' developers.  and the process
> you describe is only one form of development.  it's not applicable in a lot
> of cases.

A lot of the Linux development occurs on much more of a 'directed chaos'
approach, and that's an approach gaining favour in software engineering 
circles too. If it looks roughly right you throw it in or run it past someone
with a good eye for code in that area and throw it in. If as is normally the
case the patch is fine it works very efficiently. When the patch turns out to
be wrong it is rare that there are multiple patches likely to cause the reported
symptoms.

Also you can run continual automated testing using tools like cerberus. Yes
my Software Engineering lecturer would never have approved - but it works.

Alan
