Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id B21D34A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 11:11:49 -0700 (MST)
Message-ID: <AB57FCC5E303D511BB8F00A0C9F485C226207C@xfc02.fc.hp.com>
From: "MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>
To: "'Alan Modra'" <alan@linuxcare.com.au>, taggart@carmen.fc.hp.com
Cc: randolph@tausq.org, bdale@gag.com,
	"MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Re: new debs built, c++ is broken
Date: Fri, 16 Mar 2001 11:11:01 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Alan

> I reckon this patch will cure the problem, which I'm testing right
> now.  New gcc debs again, I'm afraid.  Anybody like to voice 
> an opinion for/against moving to the merge I've just done with
> sourceware gcc_3.0?  Looks good so far.

As you can tell :), I am in risk averse mode.  So, my opinion is - NO MERGE,
unless we have specific compelling reasons to do so.

If the patch you have solves the C++ problem (the only significant toolchain
issue at the moment), then why move up?  There may very well be some good
reasons ... I just don't know what they are.

Yes, keeping in sync with 3.0 has its advantages, but it is a moving target
and we know we will be out of sync with it.  Merging now doesn't solve the
general problem of, eventually, getting to an official 3.0 base for PA.

Alan

 
