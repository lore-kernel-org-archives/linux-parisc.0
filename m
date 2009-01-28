From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: don't touch driver core internals
Date: Wed, 28 Jan 2009 11:25:19 -0600
Message-ID: <1233163519.3236.82.camel@localhost.localdomain>
References: <20090127010733.GA21660@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	Kay Sievers <kay.sievers@vrfy.org>
To: Greg KH <greg@kroah.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090127010733.GA21660@kroah.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2009-01-26 at 17:07 -0800, Greg KH wrote:
> From: Greg Kroah-Hartman <gregkh@suse.de>
> 
> It isn't wise to use the struct device klists on their own, as their
> implementation has a tendancy to change at times.  Instead, use the
> functions created for iterating over lists of devices, as it handles all
> of the dirty klist work for you automatically.
> 
> This is needed as the driver core is changing how klists are stored in
> struct device in the near future.
> 
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: Matthew Wilcox <matthew@wil.cx>
> Cc: Grant Grundler <grundler@parisc-linux.org>
> Cc: Kay Sievers <kay.sievers@vrfy.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> 
> ---
> 
> I can keep this in my driver-core tree, where is it required in order
> for parisc to build properly.  Or you all can take this now, in your
> tree, whatever is easier for you.
> 
>  drivers/char/agp/parisc-agp.c |   24 ++++++---------
>  drivers/parisc/gsc.c          |   40 +++++++++++++++-----------
>  drivers/parisc/sba_iommu.c    |   64 ++++++++++++++++++++++++------------------
>  3 files changed, 71 insertions(+), 57 deletions(-)

Actually, we already have such a patch here:

http://marc.info/?l=linux-parisc&m=123154903507114

The approaches look identical.

James


