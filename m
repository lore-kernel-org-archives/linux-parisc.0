From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: can't find a register in class 'R1_REGS' while reloading 'asm'
Date: Tue, 15 Dec 2009 22:37:28 -0500
Message-ID: <20091216033728.GJ28962@bombadil.infradead.org>
References: <20091207223548.GA4515@raptus.dandreoli.com> <20091208012627.1D22C4FE3@hiauly1.hia.nrc.ca> <20091208030114.GA12872@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Domenico Andreoli <cavokz@gmail.com>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091208030114.GA12872@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 07, 2009 at 10:01:14PM -0500, John David Anglin wrote:
> On Mon, 07 Dec 2009, John David Anglin wrote:
> 
> > > is anybody able to reproduce it? configuration is attached.
> 
> With your config, I get the same error.
> 
> I have attached a potential work around.  The basic idea is to force
> 'a' to a specific register to avoid the spill problem in reload.
> It may be a bit risky to use 'r20' but there don't appear to be
> any real calls in __raw_spin_is_locked.
> 

Do you want this patch applied to 2.6.32-rc1, John?

regards, Kyle
