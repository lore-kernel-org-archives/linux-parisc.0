Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from trained-monkey.org (trained-monkey.org [209.217.122.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DBF04932
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 09:39:03 -0600 (MDT)
Sender: jes@trained-monkey.org
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: "'Matthew Wilcox'" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F8@umr-mail03.cc.umr.edu>
From: Jes Sorensen <jes@wildopensource.com>
Date: 01 Oct 2001 11:38:55 -0400
In-Reply-To: "Neulinger, Nathan"'s message of "Mon, 1 Oct 2001 08:31:07 -0500"
Message-ID: <m3itdzmkts.fsf@trained-monkey.org>
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Nathan" == Neulinger, Nathan <nneul@umr.edu> writes:

Nathan> But for testing, I've just tried very simple programs - cal,
Nathan> yes, echo, and a staticly linked hello world. All of them
Nathan> segfault right after execution.

Nathan> As far as I know, the only system calls out of the ordinary
Nathan> the flexlm stuff should use are file locking and perhaps some
Nathan> of the ioctl stuff for getting interface address, but I
Nathan> figured on tracing to find out exactly what it's doing.

I really don't think it should be that much work to get the basics
going, it might be a bit more to get more advanced applications up and
running.

I don't know anything really about the implementation of flexlm, but
I'd say it should be doable with a limited effort. Time to get out
that compiler and debugger and get hacking ;-)

Cheers
Jes
