Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 364B9482B
	for <parisc-linux@parisc-linux.org>; Tue, 10 Jul 2001 10:25:04 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15K0Jq-0004rj-00; Tue, 10 Jul 2001 17:25:02 +0100
Date: Tue, 10 Jul 2001 17:25:02 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVS rumors
Message-ID: <20010710172502.A6103@parcelfarce.linux.theplanet.co.uk>
References: <E15Jz7i-00028D-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E15Jz7i-00028D-00@noam.fc.hp.com>; from bame@fc.hp.com on Tue, Jul 10, 2001 at 09:08:26AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 10, 2001 at 09:08:26AM -0600, Paul Bame wrote:
> This is a problem for us because we should be able to go back
> to an older linux tree with this command:
> 
> 	cvs up -D"some-date" -rHEAD

The manpage doesn't indicate this is a valid use; indeed the wording
in some cases indicates that -D and -r are exclusive!

> 	cvs up -D"some-date"
> 
> That grabs the files as of "some-date" from whatever arbitrary branch
> they happen to be on -- thus you get some mixture of all the branches!

Yes, I noticed that.  But we have a real problem now, and I don't know how
to solve it.  Lamont wanted to check out version -pa30 -- how can he do that?

> Vendor branches are a special use of normal branches, and
> *according to the CVS design* neither are "broken".  However the way
> they are managed, mostly with 'cvs import', causes horrid problems
> with certain use models. 

Right, they're broken by design :-)

> This problem is caused by 'cvs import' and has nothing to do with
> CVS branches per se.
> 
> The way to cause REALLY BIG problems with vendor branches is to use them
> for some upstream updates, but merge others by hand on to the trunk.  This
> cuts the CVS design off at the knees!  We did this in our linux tree way
> back and the number of problems is going down but isn't gone yet.

I don't understand why we're using vendor branches at all though.  When
mang was doing CVS God duties, he imported Linus' stuff on an ordinary
branch.  What is the advantage of using vendor branches over ordinary ones?

> For now I'll be
> happy to consult and/or fix problems which result from safe-cvsimport.

No offence, but every time we've done a new import, we've discovered new
and excitingly different problems which have taken some time to be fixed.
I'm extremely nervous about using it while you're gone.

-- 
Revolutions do not require corporate support.
