From: Will Deacon <will.deacon@arm.com>
Subject: Re: Fwd: [RFC PATCH 11/16] hppa: locks: remove unused arch_*_relax
 operations
Date: Mon, 24 Jun 2013 12:37:22 +0100
Message-ID: <20130624113722.GI23779@mudshark.cambridge.arm.com>
References: <1371835057-19335-12-git-send-email-will.deacon@arm.com>
 <51C49C45.1060207@gmx.de>
 <20130624085522.GB23779@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130624085522.GB23779@mudshark.cambridge.arm.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 24, 2013 at 09:55:22AM +0100, Will Deacon wrote:
> On Fri, Jun 21, 2013 at 07:32:37PM +0100, Helge Deller wrote:
> > Thanks Will,
> 
> Hi Helge,
> 
> > forwarding to linux-parisc@vger.kernel.org so that it gets into parisc patchwork.
> > 
> > I'll queue this patch up for 3.11 if it's OK for you.
> 
> Fine by me. Each patch in the series is self-contained, so they can get
> merged via the arch trees without any problem.

Wait a second; turns out the GENERIC_LOCKBREAK code *can* emit calls to
these functions, so I'll need to sort that out before you can take the
arch-side of things.

Better hold off on this until I have that fixed.

Cheers,

Will
