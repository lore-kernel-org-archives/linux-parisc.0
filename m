Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04D014A04
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Oct 2001 09:45:20 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rLXl-0002dL-00; Wed, 10 Oct 2001 16:45:13 +0100
Date: Wed, 10 Oct 2001 16:45:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 735/125 eisa nic
Message-ID: <20011010164513.F24923@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0110100827310.4675-100000@lefou.zayda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0110100827310.4675-100000@lefou.zayda.com>; from sonny@aspersion.org on Wed, Oct 10, 2001 at 08:33:21AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 08:33:21AM +0000, Sonny Cook wrote:
> I have a 735/125 and an EISA i82596 based nic.  Does the parisc-linux
> kernel support this combination at the moment?  As far as I can tell from
> the list archives, the answer is no, but that wasn't for this specific
> combination, so I would just like to be sure.

If you read some of the messages on the list today, you'll notice I've
just got some of the necessary EISA support in place.  So the answer
is `No, not yet, but probably quite soon'.  I remember seeing some
intel-based nics in the EISA card box yesterday, so I may be able to
try out this particular card myself.

-- 
Revolutions do not require corporate support.
