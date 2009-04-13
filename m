From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Mon, 13 Apr 2009 18:15:16 +0000
Message-ID: <1239646516.3278.57.camel@mulgrave.int.hansenpartnership.com>
References: <1239636110.3278.29.camel@mulgrave.int.hansenpartnership.com>
	 <20090413180052.GB11076@xw6200.broadcom.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: "linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Michael Chan <mchan@broadcom.com>
To: Matt Carlson <mcarlson@broadcom.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090413180052.GB11076@xw6200.broadcom.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2009-04-13 at 11:00 -0700, Matt Carlson wrote:
> Hi James.  I'd like to think about this some more before we apply it.  I
> investigated this problem using a 5703 on a SPARC Ultra 10, and all my
> assumptions checked out.

Um, I think you'll find the SPARC has a special routine for extracting
the MAC address from Open Firmware, so it doesn't exercise the NVRAM
path.

>   I don't dispute that you and Robin are having
> a problem.  I just don't understand where the root cause of the problem
> is yet.  Stay tuned.

The root cause is basically that if you get the MAC from NVRAM into two
native 32 bit words, you have to be careful about how you convert them
to a byte stream for the MAC address.  You can't use a memcpy from the
native number to the MAC because it's not endian invariant (it copies
the numbers the opposite ways around on big and little endian boxes).

James


