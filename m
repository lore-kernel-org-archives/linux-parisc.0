Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5AEB54840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 11:49:20 -0600 (MDT)
Message-Id: <200310201749.h9KHnHQ3001830@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] fenv laid to rest, 50% done porting dbl-64 to ldbl-64, no testing yet.
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 20 Oct 2003 13:49:17 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20031020173440.GE32666@systemhalted> from "Carlos O'Donell" at Oct 20, 2003 01:34:40 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Yes, I have already taken this into account. Thanks for all the help
> with spec interpretation. I appreciate the feedback. We pass all the
> fenv tests in glibc, but still fail the long double support. I'm about
> 50% done porting dbl-64 to ldbl-64, might get done in the next few 
> weeks. It would finally give us a functioning long double :)

I think we should hold off on implementing this until we get a final
decision from HP on whether they will release their quadlib or not.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
