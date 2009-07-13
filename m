From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Wierd code in Entry.S
Date: Sun, 12 Jul 2009 21:54:52 -0400
Message-ID: <20090713015452.GF31925@bombadil.infradead.org>
References: <20090713011549.GE31925@bombadil.infradead.org> <20090713014438.9CAB4505D@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090713014438.9CAB4505D@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jul 12, 2009 at 09:44:37PM -0400, John David Anglin wrote:
> > Can someone distill all these mails into a patch? It will directly apply
> > to upstream and all the current stable releases, so a single patch
> > should suffice.
> > 
> > I'd do it myself, but I'm too busy writing a paper this week. :/
> 
> The most important change is attached.  Bit 12 needs to be set in the
> protection register, not bit 44.  The change has had three days testing
> on my rp3440 (PA8800) without any unusual segmentation faults.  Also,
> tested on a couple of PA8700 machines.  This fixes the problem noticed
> by Artem Alimarine.
> 
> At the moment, I don't have a change for the macros.  The DEP and DEPI
> macros conflict with PA 1.x mneumonics.  So, they should be renamed.
> I also think the 32-bit instructions in the macros should use PA 1.x
> rather than 2.0 mneumonics.  The 1.x mneumonics should be ok for both
> PA 1.x and 2.0.  It is possible that building for a PA 1.x machine might
> not work with the current macros.  Maybe James has something for the
> macros.
> 

Great. May I append a Signed-off-by: John David Anglin
<dave@hiauly1.hia.nrc.ca>?

cheers, Kyle
