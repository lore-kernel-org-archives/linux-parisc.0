Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C958D482A
	for <parisc-linux@parisc-linux.org>; Mon,  1 Apr 2002 10:28:54 -0700 (MST)
Message-Id: <200204011728.g31HSfJ3000127@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: $$remI corner case
To: bame@riverrock.org (Paul Bame)
Date: Mon, 1 Apr 2002 12:28:40 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, amodra@bigpond.net.au
In-Reply-To: <m16s4kv-000KUzC@phantom.home> from "Paul Bame" at Apr 1, 2002 09:34:01 am
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

> > I added $$dyncall to milli64.S and modified t-linux to use milli64.S.
> > This fixes the arith-rand.c fail and there are no other regressions,
> > so I think we can use milli64.S on both the 32-bit and 64-bit ports.
> 
> It looks like the appropriate #ifdefs are present in milli64.S so
> that it can be used as-is for 32-bit (so long as the "pa64" CPP
> symbol is properly defined).

We have the appropriate #ifdefs and defines to handle the different
return conventions.  My only real concern was some corner case arising
from the difference in register size.  If Alan doesn't recall anything
in the next day or so, I will apply the patch to the gcc trunk.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
