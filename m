Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77F6A4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Mar 2001 18:57:35 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA11349;
	Fri, 16 Mar 2001 12:43:16 +1100
Date: Fri, 16 Mar 2001 12:43:16 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: taggart@carmen.fc.hp.com
Cc: randolph@tausq.org, bdale@gag.com, alan_c_meyer@am.exch.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
In-Reply-To: <Pine.LNX.4.21.0103160028370.15086-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103161235420.4658-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 16 Mar 2001, Alan Modra wrote:

> Unfortunately, c++ progs still crash due to the unwind frame info list
> head being trashed.

Merging with current gcc_3.0 didn't cure the problem either.  Haven't yet
recompiled glibc with the newest compiler - started a configure of glibc,
and it seems to think gcc's version number, now 3.0, is too old.  Heh.  At
least that's easily fixed.

Alan
-- 
Linuxcare
