Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from trained-monkey.org (trained-monkey.org [209.217.122.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 673454924
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 09:51:44 -0600 (MDT)
Sender: jes@trained-monkey.org
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: "'Matthew Wilcox'" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D800@umr-mail03.cc.umr.edu>
From: Jes Sorensen <jes@wildopensource.com>
Date: 01 Oct 2001 11:51:37 -0400
In-Reply-To: "Neulinger, Nathan"'s message of "Mon, 1 Oct 2001 10:40:47 -0500"
Message-ID: <m3elonmk8m.fsf@trained-monkey.org>
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Nathan" == Neulinger, Nathan <nneul@umr.edu> writes:

Nathan> As far as I know, flexlm should be a pretty basic socket
Nathan> server, nothing fancy, other than it's retrieval of the HP
Nathan> host id, which I presume is just a syscall of some
Nathan> sort. Unfortunately, it does require use of shared lib libc
Nathan> since that's how it was linked.

Hmmm, admittedly I know little about the HPUX shared linker. However
even then I don't think it should be too big of a problem, provided
Linux/HPPA is able to map binaries at the same place as HPUX.

Jes
