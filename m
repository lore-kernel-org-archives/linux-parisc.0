Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77CF84A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Mar 2001 01:04:31 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA09616;
	Thu, 15 Mar 2001 18:51:36 +1100
Date: Thu, 15 Mar 2001 18:51:36 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: taggart@carmen.fc.hp.com, randolph@tausq.org, bdale@gag.com,
	alan_c_meyer@am.exch.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
In-Reply-To: <200103150711.CAA29105@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0103151813460.27636-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 15 Mar 2001, John David Anglin wrote:

> Uh?  Non pic code has always called pic code in libgcc.  Trashing r19
> in frame_dummy shouldn't be a problem.

The only reason pic code can be called from non-pic is that the linker
inserts magic stubs.  For some reason, that's not happening here on the
call from frame_dummy to __register_frame_info.  You're right though, it
should work.

Alan
-- 
Linuxcare
