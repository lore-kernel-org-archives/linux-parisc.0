From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Mon, 13 Apr 2009 22:19:36 -0400
Message-ID: <20090414021936.GA30359@bombadil.infradead.org>
References: <1239661059.9237.4.camel@HP1> <1239661934.3278.113.camel@mulgrave.int.hansenpartnership.com> <20090414012548.GB11615@xw6200.broadcom.net> <20090413.184035.137905532.davem@davemloft.net> <20090414020015.GC11615@xw6200.broadcom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Miller <davem@davemloft.net>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
	Michael Chan <mchan@broadcom.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Matt Carlson <mcarlson@broadcom.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20090414020015.GC11615@xw6200.broadcom.net>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 13, 2009 at 07:00:15PM -0700, Matt Carlson wrote:
> I did run some tests this afternoon on a similar IA64 HP machine and
> they ran fine.  Consequently, I'm optimistic that James' problem is local
> to his machine.  If this turns out to be a wider problem, then I agree
> we'll need to find an appropriate solution.
> 

ia64 Linux is little endian...

regards, Kyle
