From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the tracing tree with the parisc
	tree
Date: Wed, 1 Apr 2009 08:54:35 +0200
Message-ID: <20090401065435.GA9208@pengutronix.de>
References: <20090401113740.7f425e02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20090401113740.7f425e02.sfr@canb.auug.org.au>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Steven,

On Wed, Apr 01, 2009 at 11:37:40AM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the tracing tree got a conflict in
> arch/parisc/include/asm/ftrace.h between commit
> d75f054a2cf0614ff63d534ff21ca8eaab41e713 ("parisc: add ftrace (functi=
on
> and graph tracer) functionality") from the parisc tree and commit
> c79a61f55773d2519fd0525bf58385f7d20752d3 ("tracing: make CALLER_ADDRx
> overwriteable") from the tracing tree.
Whatever you have done---I didn't check---as long as
arch/parisc/include/asm/ftrace.h exists, it's OK for
c79a61f55773d2519fd0525bf58385f7d20752d3.

Best regards and thanks
Uwe

--=20
Pengutronix e.K.                              | Uwe Kleine-K=F6nig     =
       |
Industrial Linux Solutions                    | http://www.pengutronix.=
de/  |
