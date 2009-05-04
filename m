From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH] parisc: remove driver_data direct access of struct
	device
Date: Mon, 4 May 2009 14:36:51 -0700
Message-ID: <20090504213651.GA31230@suse.de>
References: <20090504201359.GA23098@kroah.com> <20090504213349.GD5468@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Greg KH <greg@kroah.com>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090504213349.GD5468@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 04, 2009 at 05:33:49PM -0400, Kyle McMartin wrote:
> On Mon, May 04, 2009 at 01:13:59PM -0700, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@suse.de>
> > 
> > In the near future, the driver core is going to not allow direct access
> > to the driver_data pointer in struct device.  Instead, the functions
> > dev_get_drvdata() and dev_set_drvdata() should be used.  These functions
> > have been around since the beginning, so are backwards compatible with
> > all older kernel versions.
> > 
> 
> Cool, applied and will be sent along tonight unless you'd rather merge
> it yourself in which case:
> 
> Acked-by: Kyle McMartin <kyle@mcmartin.ca>

Nope, feel free to send it yourself, no objection from me at all :)

thanks,

greg k-h
