Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA09745
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 17:16:58 -0700
Sender: drepper@cygnus.com
To: Cary Coutant <cary@cup.hp.com>
Cc: "Paul Bame" <bame@noam.fc.hp.com>, <parisc-linux@thepuffingroup.com>,
        <parisc-linux@puffin.external.hp.com>
Subject: Re: [parisc-linux] Help with posix_types.h
References: <200011160001.QAA05126@adlmail.cup.hp.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 15 Nov 2000 16:04:51 -0800
In-Reply-To: Cary Coutant's message of "Wed, 15 Nov 2000 16:00:49 -0800"
Message-ID: <m3snosbx3w.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant <cary@cup.hp.com> writes:

> On PA-RISC, the thread pointer is kept in the read-only control register 
> CR 27.
> 
> For user-thread implementations, we provided a kernel API to change the 
> contents of the register.

This works fine for a 1:1 thread implementation but adds significant
runtime hits for a m:n implementation.  The latter is the direction we
are heading.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
