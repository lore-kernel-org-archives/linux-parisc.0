Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C62ED4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Dec 2002 16:26:35 -0700 (MST)
Message-Id: <200212042301.gB4N1riC000738@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: FATAL: kernel too old
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Wed, 4 Dec 2002 18:01:52 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jbailey@nisa.net, carlos@baldric.uwo.ca,
	libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021204225504.GB22403@dsl2.external.hp.com> from "Grant Grundler" at Dec 4, 2002 03:55:04 pm
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

> Dave,
> I can build a UP 2.4.20 for the rp2470 and see how that fairs.
> SMP has in fact not been especially stable for the 2.4.19 hppa releases.

That would be great.  I was going to try vmlinux-2.4.20-rc1-pa7
after the gcc testsuite run that is in progress completes.  I seem
to recall that vmlinux-2.4.20-rc1-pa7 wasn't very stable, so it
would be nice to find something later than 2.4.18 that works reasonably
reliably.

I was trying to get a feel whether of not the current gcc mainline
would successfully build the latest glibc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
