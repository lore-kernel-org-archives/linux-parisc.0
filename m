From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: what's in parisc-2.6.git
Date: Tue, 23 Jun 2009 20:41:29 -0400
Message-ID: <20090624004129.GB3101@bombadil.infradead.org>
References: <20090623161516.GA12499@hera.kernel.org> <20090624002921.2D5544EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090624002921.2D5544EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 23, 2009 at 08:29:20PM -0400, John David Anglin wrote:
> > The following changes since commit d888a4c76c51092993643f8992bf55b3c28da483:
> >   Linus Torvalds (1):
> >         Merge branch 'for-linus' of git://git.kernel.org/.../vapier/blackfin
> > 
> > are available in the git repository at:
> 
> Thanks for bring this up to date.
> 
> What the status of the changes in the parisc-2.6.29 branch?  The sba_iommu
> fix seems obvious.

I think those have all been merged already, except the sysvipc stuff,
but I haven't had the cycles to look into those recently. The two top
patches effecting sysvipc are bogus though and will break 'ipcs' and
various userspace bits.

regards, Kyle
