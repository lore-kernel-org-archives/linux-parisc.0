Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id B636F4A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Mar 2001 20:04:17 -0700 (MST)
To: Robert Liesenfeld <xunil96@yahoo.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Init not found on 735/125? 
In-Reply-To: Your message of "Wed, 21 Mar 2001 17:19:55 PST."
             <20010322011955.17416.qmail@web5503.mail.yahoo.com>
References: <20010322011955.17416.qmail@web5503.mail.yahoo.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 21 Mar 2001 20:06:51 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010322030651.33A5B38145@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Robert Liesenfeld writes...

> I'm much closer to being able to install palinux on my 735/125...at the momen
> t, the main problem
> I'm having is this:
[snip]

You could try using sash as init and see if you get further. I think this is 
the same problem as Richard mentioned in,

http://lists.parisc-linux.org/pipermail/parisc-linux/2001-March/012025.html

It's solved by a new glibc that's 16 byte aligned. See the message I just sent 
out about where to get the new glibc debs from.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
