Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 924F24830
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 11:50:58 -0600 (MDT)
Message-Id: <200404231750.i3NHouD9019650@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
To: James.Bottomley@SteelEye.com (James Bottomley)
Date: Fri, 23 Apr 2004 13:50:55 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1082740179.2017.45.camel@mulgrave> from "James Bottomley" at Apr
	23, 2004 01:09:39 pm
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

> > Can you use "b,l" for PA 2.0 code?
> 
> Well, the 2.0 manual implies b,l can be used whether the execution is in
> wide or narrow mode, so yes, it should apply to all 2.0 code.

Yes, that's what gcc generates for PA 2.0.

Regarding the assembler, I'm wondering if we want the keep "bl" for
generating 17-bit branches.  It's rather confusing and inconsistent
with the mnemonic mapping given in the 2.0 manual.  On the otherhand,
gas has been this way for 4-5 years.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
