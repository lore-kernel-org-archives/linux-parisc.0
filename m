Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA15881
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Mar 2000 19:12:11 -0700
Sender: subc@mailserv2.iuinc.com
Message-ID: <38D1867C.F8098460@subcarrier.org>
Date: Thu, 16 Mar 2000 20:12:28 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
CC: Philipp Rumpf <prumpf@inwestnet.de>
Subject: [parisc-linux] 2.3.99pre1 merge CANCELLED
References: <20000315140309.U27942@thepuffingroup.com> <20000316121525.H673@abacus.local>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

There have now been reported several problems with the 2.3.99pre1
release, so prumpf is right that we should hold off merging for now. 
Once there is a stable 2.3.99preX release, we should merge to that
kernel since it has been some time since our last merge.

This has been a test of the emergency merge system, we now return you to
our (ir)regularly scheduled hacking.

	- Mike.

Philipp Rumpf wrote:
> 
> On Wed, Mar 15, 2000 at 02:03:09PM -0500, willy@thepuffingroup.com wrote:
> > Linus released 2.3.99pre1 today which marks the start of the 2.4
> > release effort.  We'd like to merge Linus' changes into our tree on
> > Friday, starting around 11am EST (8am PST, 4pm UTC, 5pm CET).
> 
> Wouldn't it be a good idea to choose a kernel that has been released for more
> than 2 days for merging ?
