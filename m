Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-5-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19010482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 08:27:38 -0600 (MDT)
Date: Tue, 28 May 2002 15:27:36 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Cc: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020528142736.GA9288@tykepenguin.com>
References: <20020527001321.A6629@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020527001321.A6629@systemhalted>
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

On Mon, May 27, 2002 at 12:13:21AM -0400, Carlos O'Donell Jr. wrote:
> Parisc,
> 
> All the changes from -pa24 to -p26 have been merged into the
> kdb-v21 tree (that Randolph graciously started!). Thanks go
> to bame's recipe!
> 
> A few tests show that it is equivalent to the patches I had 
> produced (fixes to traps.c for the soft power button).
> 
> If kdb is your bag, then it should all be set to go!

I can't get it to boot on my C110 - it gets stuck at the old familar "if this is
the last message you see" message. I can run the Debian 2.4.18 kernel OK on this
box.

Any ideas anyone?

patrick
