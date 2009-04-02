From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the tracing tree with the parisc
	tree
Date: Thu, 02 Apr 2009 13:54:43 +0000
Message-ID: <1238680483.3383.7.camel@mulgrave.int.hansenpartnership.com>
References: <20090401113740.7f425e02.sfr@canb.auug.org.au>
	 <20090401175033.GE1443@bombadil.infradead.org>
	 <20090402223205.e4ab7b5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-next@vger.kernel.org, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Steven Rostedt <srostedt@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090402223205.e4ab7b5e.sfr@canb.auug.org.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2009-04-02 at 22:32 +1100, Stephen Rothwell wrote:
> Hi Kyle,
> 
> On Wed, 1 Apr 2009 13:50:34 -0400 Kyle McMartin <kyle@mcmartin.ca> wrote:
> >
> > What's the optimal way to sort out multiple branches in this tree?
> > Apparently Andrew is cross with me because the rtc-parisc branch didn't
> > get picked up... Should I put a list of branches in my kernel.org
> > public_html or something?
> 
> I am not quite sure what you are getting at.  If you have multiple trees
> (or branches in a tree), I can merge them separately into linux-next -
> just tell me what they are.

Actually, the traditional way for a multi branch tree (something like
Jens' Block tree) which contains all manner of branches, some of which
are experimental and shouldn't be in linux-next, is to have a next
branch into which you manually merge all branches that should be
included.

James


