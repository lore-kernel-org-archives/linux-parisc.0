Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42A334829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 10:57:58 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.8/8.12.8) with ESMTP id h2IHhvsQ010639
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 12:43:58 -0500 (EST)
Message-Id: <200303181743.h2IHhtaI010636@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] squid pb with glibc-2.3.1 and pthread (pb reproduced now)
To: jsoe0708@tiscali.be (Joel Soete)
Date: Tue, 18 Mar 2003 12:43:54 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E68A396000020A5@ocpmta7.freegates.net> from "Joel Soete" at Mar 18, 2003 06:35:53 pm
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

> I presume that this patch is not yet into libc6_2.3.1-15 dpkg (I also run
> the test case with the same pb on an unstable debian running on b2k); so
> my question is: does it exist somewhere a patch against this dpkg src which
> I can test?

I just checked.  The patch is in -15.  It wasn't in -14.  I haven't tried
-15.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
