Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 911E84841
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Dec 2003 11:30:10 -0700 (MST)
Message-Id: <200312011830.hB1IU7in003367@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] rewrite kernel spinlock code to work better with gcc
To: soete.joel@tiscali.be (Joel Soete)
Date: Mon, 1 Dec 2003 13:30:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3FB265EC0000B651@ocpmta3.freegates.net> from "Joel Soete" at Dec 1, 2003 04:14:35 pm
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

> (Just in case it would help) I backport your patch in 2.4 (just because the
> only system on which I can test it is a b2k on which 2.6 doesn't boot yet)
> and build a smp 64bit kernel which boot and run fine (rebuild another kernel)
> on this b2k:)

I'd forgotten about the "ldcw,co" errata for PA 2.0.  You only want/need
self-aligning locks for PA 1.x.  You should be able to test this on a
PA 2.0 machine if you don't define CONFIG_PA20.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
