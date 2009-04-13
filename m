From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Mon, 13 Apr 2009 14:04:26 -0400
Message-ID: <20090413180426.GE6072@bombadil.infradead.org>
References: <1239636110.3278.29.camel@mulgrave.int.hansenpartnership.com> <20090413180052.GB11076@xw6200.broadcom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	"linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Michael Chan <mchan@broadcom.com>
To: Matt Carlson <mcarlson@broadcom.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090413180052.GB11076@xw6200.broadcom.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Apr 13, 2009 at 11:00:52AM -0700, Matt Carlson wrote:
> Hi James.  I'd like to think about this some more before we apply it.  I
> investigated this problem using a 5703 on a SPARC Ultra 10, and all my
> assumptions checked out.  I don't dispute that you and Robin are having
> a problem.  I just don't understand where the root cause of the problem
> is yet.  Stay tuned.
> 

Did your card in the sparc have an openfirmware ROM? If so, it probably
used the ofw tree to obtain parameters instead of the card nvram...

regards, Kyle
