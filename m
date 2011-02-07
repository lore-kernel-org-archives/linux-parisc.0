From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [patch 0/8] parisc: Convert to new irq_chip functions
Date: Mon, 07 Feb 2011 10:02:15 -0600
Message-ID: <1297094535.8577.3.camel@mulgrave.site>
References: <20110206204411.109238550@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110206204411.109238550@linutronix.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-02-06 at 20:45 +0000, Thomas Gleixner wrote:
> The following series converts parisc to the new irq_chip functions and
> sets GENERIC_HARDIRQS_NO_DEPRECATED. Compile tested only.

You don't really need one patch per file in the irq function changes do
you? ... unless you're being rechristened Joe Perches ...

I can't get the last patch to apply ... it looks like there are lots of
other Kconfig changes besides the one liner it does; what's missing?

Thanks,

James


