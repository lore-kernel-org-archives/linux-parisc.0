From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tracing tree with the parisc
	tree
Date: Wed, 1 Apr 2009 13:19:01 +0200
Message-ID: <20090401111901.GD15442@elte.hu>
References: <20090401113740.7f425e02.sfr@canb.auug.org.au> <20090401110512.GB15442@elte.hu> <20090401111036.GA5894@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20090401111036.GA5894@pengutronix.de>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> wrote:

> Hello Ingo,
>=20
> On Wed, Apr 01, 2009 at 01:05:12PM +0200, Ingo Molnar wrote:
> >=20
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >=20
> > > Hi all,
> > >=20
> > > Today's linux-next merge of the tracing tree got a conflict in
> > > arch/parisc/include/asm/ftrace.h between commit
> > > d75f054a2cf0614ff63d534ff21ca8eaab41e713 ("parisc: add ftrace (fu=
nction
> > > and graph tracer) functionality") from the parisc tree and commit
> > > c79a61f55773d2519fd0525bf58385f7d20752d3 ("tracing: make CALLER_A=
DDRx
> > > overwriteable") from the tracing tree.
> > >=20
> > > The former adds a non-trivial version of the file, so I used that=
=2E
> >=20
> > You need to be careful, the two trees likely cannot be combined lik=
e=20
> > that, ftrace will likely stop working on parisc because you combine=
=20
> > old-parisc with new-ftrace.
> >=20
> > If the two trees are integrated without forward-porting the parisc=20
> > ftrace port to the new facilities, then it's safer to do a trivial=20
> > patch that disables the ftrace bits on parisc.
>
> I'm not sure that they really conflict.  My change ("tracing: make=20
> CALLER_ADDRx overwriteable") only created the empty include file=20
> that I can unconditionally include <asm/ftrace.h>.

I know, that commit is not a problem. It just exposed the problem=20
that these trees got combined in linux-next.

	Ingo
