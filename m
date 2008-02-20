From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] pci: remove parisc consumer of the pci global_list
Date: Wed, 20 Feb 2008 14:22:48 -0800
Message-ID: <20080220222248.GA15308@kroah.com>
References: <1203542065.3109.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1203542065.3109.42.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 20, 2008 at 03:14:24PM -0600, James Bottomley wrote:
> The patch  pci-remove-global-list-of-pci-devices.patch misses the parisc
> dino use of this.  However, it's a simple removal job.
> 
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

Ah, sorry about that, I'll add that to my tree in the correct order so
we don't get bisect problems.

thanks,

greg k-h
