Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA23658
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Feb 2000 11:07:15 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <38A2EF04.E4C413D9@subcarrier.org>
Date: Thu, 10 Feb 2000 12:01:56 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Merge complete. Go crazy.
List-ID: <linux-parisc.vger.kernel.org>

The merge with 2.3.42 is complete and the tree is now open for all
checkins.

The merge went relatively smoothly thanks to everyone's cooperation and
coordination.  It takes teamwork to escape merge hell quickly :)

The proposed plan for continuing to track Linus' kernel is to merge in
Linus' changes about once a month.  The criteria to determine the point
at which we merge will be if there are changes we want to pick up and if
Linus' kernel is relatively stable.  The merge we just finished was a
big one (2.3.29 to 2.3.42) -- if we merge more often the patches we have
to apply to our tree will be smaller.

We will want to sync up with 2.4 as soon as it is released so we can
generate clean diffs for the features we want to propagate back to Linus
for 2.5.

	- Mike.
