Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 774D5482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 09:52:11 -0600 (MDT)
Date: Tue, 5 Jun 2001 10:53:50 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
In-Reply-To: <20010605160653.L25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106051051070.22868-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Can any of the HP people comment on where the second serial port on a D310
lives? I've looked through the lasi docs and on page 81 it mentions to
look in the Primary IO Configuration Register, bit 4, to see if there are
two ports, but the location isn't listed on the memory map anywhere.

dave

-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
