Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id FAA25032
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 05:10:26 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 73B30B008; Thu, 16 Nov 2000 12:09:57 +0000 (GMT)
Date: Thu, 16 Nov 2000 12:09:57 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Single-stepping
Message-ID: <20001116120957.V32715@linuxcare.com>
References: <20001115184808.P32715@linuxcare.com> <200011151949.OAA22929@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011151949.OAA22929@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Wed, Nov 15, 2000 at 02:49:02PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 15, 2000 at 02:49:02PM -0500, John David Anglin wrote:
> >   I've been helping Alan Modra out with kernel changes to support
> > single stepping for gdb.  Paul Bame suggested I bounced our ideas
> > off you in case you (or anyone else) had any comments.  I havn't
> > actually committed my changes yet.
> > 
> > The basic approach is to use the recovery counter to generate
> > a trap every instruction.  The scheme is complicated because a
> > suspended process may or may not return to user space via an RFI.
> 
> I really don't know enough to comment on the implementation choice.  Why
> did you decide on this approach as opposed to inserting breaks and
> enabling the taken branch branch trap (T)?  It would appear that the recovery
> counter was intended to provide software recovery from hardware faults
> in fault tolerant systems.  Possibly, Grant could comment on whether
> it is actually useful for this purpose.

Alan Modra made those early decisions, but I gather that he went
for the recovery counter because it at least appears to be rather
more straightforward.

Richard
