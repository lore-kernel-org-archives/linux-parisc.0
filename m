From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 56/64] parisc: remove driver_data direct access of
	struct device
Date: Tue, 16 Jun 2009 09:25:24 -0700
Message-ID: <20090616162524.GF26879@suse.de>
References: <20090616051351.GA23627@kroah.com> <1245131213-24168-56-git-send-email-gregkh@suse.de> <20090616151524.GA15952@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Helge Deller <deller@gmx.de>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090616151524.GA15952@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 16, 2009 at 11:15:24AM -0400, Kyle McMartin wrote:
> On Mon, Jun 15, 2009 at 10:46:45PM -0700, Greg Kroah-Hartman wrote:
> > In the near future, the driver core is going to not allow direct access
> > to the driver_data pointer in struct device.  Instead, the functions
> > dev_get_drvdata() and dev_set_drvdata() should be used.  These functions
> > have been around since the beginning, so are backwards compatible with
> > all older kernel versions.
> > 
> > Cc: linux-parisc@vger.kernel.org
> > Cc: Helge Deller <deller@gmx.de>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> 
> Acked-by: Kyle McMartin <kyle@mcmartin.ca>
> 
> Do you want to push it along with the rest of them, or would you like me
> to apply it?

This was sent a while ago, and is going to Linus right now.  So if you
want to also add it to your tree, so that it is sure to not get lost,
that is fine with me :)

thanks,

greg k-h
