From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [patch 07/13] parisc: Fixup last users of irq_chip->typename
Date: Wed, 18 Nov 2009 17:13:31 -0500
Message-ID: <20091118221330.GF28962@bombadil.infradead.org>
References: <20091117224852.846805939@linutronix.de> <20091117224916.604120310@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>,
	Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091117224916.604120310@linutronix.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 17, 2009 at 10:50:59PM -0000, Thomas Gleixner wrote:
> The typename member of struct irq_chip was kept for migration purposes
> and is obsolete since more than 2 years. Fix up the leftovers.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: linux-parisc@vger.kernel.org

Thanks, applied.
