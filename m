Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 929164841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 Oct 2003 11:31:21 -0600 (MDT)
Message-Id: <200310211731.h9LHVJaP006368@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] fenv laid to rest, 50% done porting dbl-64 to ldbl-64, no testing yet.
To: soete.joel@tiscali.be (Joel Soete)
Date: Tue, 21 Oct 2003 13:31:18 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3F8A272E00004E7B@ocpmta3.freegates.net> from "Joel Soete" at Oct 21, 2003 12:42:17 pm
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

> >I think we should hold off on implementing this until we get a final
> >decision from HP on whether they will release their quadlib or not.
> 
> It's a long time we are awaiting this decision?

Yes.

> In the mean time, does it exists an URL where I can find spec?

The library implements the basic arithmetic operations for the long
double type.  I believe that you have to pay to get the spec from
ANSI or IEC (ANSI/IEEE Std 754-1985 or IEC 60559).  I don't have
a copy but possibly you might find one with google.  The HP library
isn't publicly documented but it's pretty obvious what the routines
do.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
