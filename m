Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA26940
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 13:42:19 -0600
Message-Id: <200007121943.PAA04579@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Internal compiler error
To: willy@thepuffingroup.com
Date: Wed, 12 Jul 2000 15:43:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <20000712141541.B3593@vodka.thepuffingroup.com> from "willy@thepuffingroup.com" at Jul 12, 2000 02:15:41 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> is in gcc/gcc/ChangeLog.  The last comment which isn't ours in ChangeLog
> is dated 2000-07-07.  any changes since then which look even remotely
> relevant?

Not that I am aware of.

There is a patch related to the alignment of fields that is not installed
because of portability concerns.  Alignments greater than 16 bytes are
not done correctly and may cause the compiler to abort due to a divide
by zero.  This may be important for the linux port.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
