Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2333C4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 11:29:14 -0700 (MST)
Message-Id: <200103161827.NAA17316@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
To: alan_meyer@hp.com (MEYER, ALAN C.)
Date: Fri, 16 Mar 2001 13:27:22 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, taggart@carmen.fc.hp.com,
	randolph@tausq.org, bdale@gag.com, alan_meyer@hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <AB57FCC5E303D511BB8F00A0C9F485C226207C@xfc02.fc.hp.com> from "MEYER,ALAN C." at Mar 16, 2001 11:11:01 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > I reckon this patch will cure the problem, which I'm testing right
> > now.  New gcc debs again, I'm afraid.  Anybody like to voice 
> > an opinion for/against moving to the merge I've just done with
> > sourceware gcc_3.0?  Looks good so far.
> 
> As you can tell :), I am in risk averse mode.  So, my opinion is - NO MERGE,
> unless we have specific compelling reasons to do so.

I am of the opposite opinion.  The 3.0 is approaching release.  Alan has
some patches in his branch that haven't been vetted for sourceware 3.0
and now is a good time to have them vetted.  Gcc releases don't come
very often and it would be good if 3.0 had the features and fixes needed
for parisc-linux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
