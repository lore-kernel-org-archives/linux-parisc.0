From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't find a register in class 'R1_REGS' while reloading 'asm'
Date: Tue, 15 Dec 2009 23:16:30 -0500 (EST)
Message-ID: <20091216041631.202E24EF2@hiauly1.hia.nrc.ca>
References: <20091216033728.GJ28962@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, cavokz@gmail.com,
	linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091216033728.GJ28962@bombadil.infradead.org> from "Kyle McMartin" at Dec 15, 2009 10:37:28 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, Dec 07, 2009 at 10:01:14PM -0500, John David Anglin wrote:
> > On Mon, 07 Dec 2009, John David Anglin wrote:
> > 
> > > > is anybody able to reproduce it? configuration is attached.
> > 
> > With your config, I get the same error.
> > 
> > I have attached a potential work around.  The basic idea is to force
> > 'a' to a specific register to avoid the spill problem in reload.
> > It may be a bit risky to use 'r20' but there don't appear to be
> > any real calls in __raw_spin_is_locked.
> > 
> 
> Do you want this patch applied to 2.6.32-rc1, John?

Yes, I think it's a reasonable work around.  I did check that it
resolves the kernel build error.

There is a GCC PR on this issue, but fixing the problem isn't easy.  See
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=35193

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
