Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CFB24830
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 13:27:05 -0600 (MDT)
Message-Id: <200404231927.i3NJR33f016630@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Fri, 23 Apr 2004 15:27:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1082746870.1913.48.camel@mulgrave> from "James Bottomley" at Apr
	23, 2004 03:01:09 pm
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

> On Fri, 2004-04-23 at 13:50, John David Anglin wrote:
> > Yes, that's what gcc generates for PA 2.0.
> > 
> > Regarding the assembler, I'm wondering if we want the keep "bl" for
> > generating 17-bit branches.  It's rather confusing and inconsistent
> > with the mnemonic mapping given in the 2.0 manual.  On the otherhand,
> > gas has been this way for 4-5 years.
> 
> Yes, I think our current pressing problem is to discover why hppa64-ld
> is generating out of range PCREL17F branches instead of stubbing them. 
> That's definitely what's causing the boot failure in 2.6.6-rc1-pa0.
> 
> It's so strange.  Since the init section is quite a way away, it should
> already be stubbing jumps to the init section.  I can't work out why the
> addition of yet another section (this time covering scheduler functions)
> suddenly causes it to fail.

I think I know why.  The 64-bit linker only supports a single stub
table.  Things go bad when a branch can't reach its stub.  I hit this
when I was trying to implement tail calls.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
