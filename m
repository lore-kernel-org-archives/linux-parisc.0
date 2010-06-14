From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 2.6.35-rc1 and RCU
Date: Mon, 14 Jun 2010 09:47:15 -0400
Message-ID: <20100614134715.GI20317@bombadil.infradead.org>
References: <20100604094405.GM28492@bombadil.infradead.org> <4C08E5FE.80905@gmx.de> <20100604155033.GC20317@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100604155033.GC20317@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 04, 2010 at 11:50:33AM -0400, Kyle McMartin wrote:
> On Fri, Jun 04, 2010 at 01:39:42PM +0200, Helge Deller wrote:
> > On 06/04/2010 11:44 AM, Kyle McMartin wrote:
> > > Did anyone else see a hang on 2.6.35-rc1 just after RCU initializes?
> > 
> > Yes, I did see this as well.
> > 
> 
> Cool, next time I reboot I'll see if initcall_debug helps.
>

I debugged this further, it appears to be a code generation bug...

if kernel/rcutree_plugin.h::rcu_bootup_announce_oddness is not called,
we don't hang.

But it's just a bunch of #ifdef'd printks, so I'm not sure how that
could be going wrong.

More debugging to come.
