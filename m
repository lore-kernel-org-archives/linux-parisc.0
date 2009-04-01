From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: linux-next: manual merge of the tracing tree with the parisc
	tree
Date: Wed, 1 Apr 2009 13:50:34 -0400
Message-ID: <20090401175033.GE1443@bombadil.infradead.org>
References: <20090401113740.7f425e02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Steven Rostedt <srostedt@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090401113740.7f425e02.sfr@canb.auug.org.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 01, 2009 at 11:37:40AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tracing tree got a conflict in
> arch/parisc/include/asm/ftrace.h between commit
> d75f054a2cf0614ff63d534ff21ca8eaab41e713 ("parisc: add ftrace (function
> and graph tracer) functionality") from the parisc tree and commit
> c79a61f55773d2519fd0525bf58385f7d20752d3 ("tracing: make CALLER_ADDRx
> overwriteable") from the tracing tree.
> 
> The former adds a non-trivial version of the file, so I used that.
>

Thanks Stephen,

What's the optimal way to sort out multiple branches in this tree?
Apparently Andrew is cross with me because the rtc-parisc branch didn't
get picked up... Should I put a list of branches in my kernel.org
public_html or something?

r, Kyle
