Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id MAA00792
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 12:47:10 -0700
Message-Id: <200011151949.OAA22929@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Single-stepping
To: rhirst@linuxcare.com (Richard Hirst)
Date: Wed, 15 Nov 2000 14:49:02 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@puffin.external.hp.com
In-Reply-To: <20001115184808.P32715@linuxcare.com> from "Richard Hirst" at Nov 15, 2000 06:48:08 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   I've been helping Alan Modra out with kernel changes to support
> single stepping for gdb.  Paul Bame suggested I bounced our ideas
> off you in case you (or anyone else) had any comments.  I havn't
> actually committed my changes yet.
> 
> The basic approach is to use the recovery counter to generate
> a trap every instruction.  The scheme is complicated because a
> suspended process may or may not return to user space via an RFI.

I really don't know enough to comment on the implementation choice.  Why
did you decide on this approach as opposed to inserting breaks and
enabling the taken branch branch trap (T)?  It would appear that the recovery
counter was intended to provide software recovery from hardware faults
in fault tolerant systems.  Possibly, Grant could comment on whether
it is actually useful for this purpose.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
