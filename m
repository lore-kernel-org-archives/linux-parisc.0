Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta06ps.bigpond.com (mta06ps.bigpond.com [144.135.25.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id F16CB482A
	for <parisc-linux@parisc-linux.org>; Tue,  2 Apr 2002 04:30:56 -0700 (MST)
Received: from bubble.local ([144.135.25.81]) by
          mta06ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GTXUMU00.0XL for <parisc-linux@parisc-linux.org>; Tue, 2 Apr
          2002 21:30:30 +1000
Date: Tue, 2 Apr 2002 21:00:26 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Paul Bame <bame@riverrock.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: $$remI corner case
Message-ID: <20020402113026.GA1042@bubble.sa.bigpond.net.au>
References: <m16s4kv-000KUzC@phantom.home> <200204011728.g31HSfJ3000127@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200204011728.g31HSfJ3000127@hiauly1.hia.nrc.ca>
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

On Mon, Apr 01, 2002 at 12:28:40PM -0500, John David Anglin wrote:
> > > I added $$dyncall to milli64.S and modified t-linux to use milli64.S.
> > > This fixes the arith-rand.c fail and there are no other regressions,
> > > so I think we can use milli64.S on both the 32-bit and 64-bit ports.
> > 
> > It looks like the appropriate #ifdefs are present in milli64.S so
> > that it can be used as-is for 32-bit (so long as the "pa64" CPP
> > symbol is properly defined).
> 
> We have the appropriate #ifdefs and defines to handle the different
> return conventions.  My only real concern was some corner case arising
> from the difference in register size.  If Alan doesn't recall anything
> in the next day or so, I will apply the patch to the gcc trunk.

No, I don't recall any such corner cases, but then I don't think
I ever looked into the code in any detail.  It was more a case of
doing robotic edits to suit the gcc build machinery.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
