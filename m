Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E06CF4DAE
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Apr 2004 17:13:58 -0600 (MDT)
Message-Id: <200404222313.i3MNDv9d017627@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Thu, 22 Apr 2004 19:13:56 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1082674474.2860.127.camel@mulgrave> from "James Bottomley" at
	Apr 22, 2004 06:54:34 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Thu, 2004-04-22 at 18:50, John David Anglin wrote:
> > If schedule is too far away, the linker will add a long branch stub.
> > This apparently doesn't work in the kernel.  On the otherhand, `b,l'
> > should go about 8 MB without needing a stub.
> 
> Well, but it does ... we have other jumps that seem to be correctly
> stubbed.

Looking at a couple ok 64-bit kernels, I'm surprised that stubs are
needed for "b,l x,%rp".  It suggests that these branches are getting
treated as 17-bit branches instead of 22-bit branches.  Of course,
"b" is limited to 17-bit displacements and it could easily need
a stub.

Which tool chain?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
