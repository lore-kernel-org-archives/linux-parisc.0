Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 155A64858
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Apr 2003 18:28:26 -0600 (MDT)
Message-Id: <200304270028.h3R0SM1v014466@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructors
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sat, 26 Apr 2003 20:28:22 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: hans_boehm@hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030426212442.GB14330@systemhalted> from "Carlos O'Donell" at Apr 26, 2003 05:24:42 pm
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

> Good catch. I hadn't bothered looking at the .S!
> Again the recommendation is going to be "Use a newer gcc" :)

I should have mentioned that the problem is fixed in all the gcc versions
that I originally tried.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
