Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA23655
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Dec 1999 14:19:20 -0700
Message-Id: <199912092121.QAA03680@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] a pretty big change
To: ulrich_strelow@yahoo.com (Ulrich Strelow)
Date: Thu, 9 Dec 1999 16:21:00 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19991209122431.18795.qmail@web505.mail.yahoo.com> from "Ulrich Strelow" at Dec 9, 99 04:24:31 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> So I thought 0xc004a078 is in get_unused_buffer_head
> which is in fs/buffer.c.

I think the bug you are seeing is due to the inline definition for
xchg in asm/system.h.  The problem occurs in exchanges with 0 when
the address used in the ldcws instruction is not aligned on a 16 byte
boundary.  Change the define for xchg to just use the spinlock method
in all cases.

The other option is to align all the addresses that are used in xchg's
with 0.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
