Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C85BB482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Aug 2001 16:19:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15S4Kj-0006RH-00; Wed, 01 Aug 2001 23:19:17 +0100
Date: Wed, 1 Aug 2001 23:19:17 +0100
From: Matthew Wilcox <willy@debian.org>
To: robert.holmberg@idobath.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux on R947X?
Message-ID: <20010801231917.E4199@parcelfarce.linux.theplanet.co.uk>
References: <OF2C1CB198.AE5E0FF8-ONC2256A9B.00370379@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OF2C1CB198.AE5E0FF8-ONC2256A9B.00370379@LocalDomain>; from robert.holmberg@idobath.com on Wed, Aug 01, 2001 at 01:04:56PM +0300
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 01, 2001 at 01:04:56PM +0300, robert.holmberg@idobath.com wrote:
> Any hope of getting the Lotus Domino webserver up and running under
> PARISC-LINUX on a R947X? The server is going to be replaced soon, and we
> have played with the thought of using it as a local test environment for
> deployment of Domino web applications.

According to the Domino website
(http://www.lotus.com/home.nsf/welcome/domino), they only support
Linux on x86.  They do have a version for HPUX so if we were to get
the HPUX emulation working again, there's a possibility it might work.
Nobody has much interest in the HPUX emulation right now, so I wouldn't
count on it happening any time soon.

On the other hand if you happen to be a big corporate customer and could
persuade them to port Domino to a different platform... :-)

-- 
Revolutions do not require corporate support.
