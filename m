Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E593482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 09:56:42 -0700 (MST)
Message-Id: <200302111656.h1BGudvD012174@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Squid freeze
To: badmax@club-internet.fr (Bad Max)
Date: Tue, 11 Feb 2003 11:56:39 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <yam9172.1240.149231680@mail.club-internet.fr> from "Bad Max" at Feb 11, 2003 05:38:24 pm
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

> Now squid work perfectly. I suspect a bug in gcc, what do you think
> about ?

I fixed a hang in the libstdc++ locking code on the weekend.  This
affects gcc 3.3 and later on PA 1.x machines.  Other than that,
there are no reported/known freezes caused by gcc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
