From: Christoph Hellwig <hch@infradead.org>
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
Date: Sat, 27 Sep 2003 19:43:19 +0100
Message-ID: <20030927194319.A30759__38124.0966184579$1416622818$gmane$org@infradead.org>
References: <1064634188.641.27.camel@laptop.bradetich.net> <1064677551.2002.20.camel@mulgrave> <20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	Ryan Bradetich <rbradetich@uswest.net>,
	SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Sat, Sep 27, 2003 at 07:37:56PM +0100
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Sep 27, 2003 at 07:37:56PM +0100, Matthew Wilcox wrote:
> -       struct host_data *host_data = (struct host_data *)host->hostdata;
> +       struct host_data *host_data;
>  #ifdef DEBUG_NCR53C8XX
>         printk("ncr53c8xx: release\n");
>  #endif
> -       if (host_data->ncb)
> +       if (!host)
> +               return 1;
> +       host_data = (struct host_data *)host->hostdata;
> +       if (host_data && host_data->ncb)
>                 ncr_detach(host_data->ncb);
>         return 1;
>  }
> 
> and it does fix the problem.  Maybe it's too much checking, but I'm not
> interested in tracking down bugs like this again ;-)

Or better just stop calling ncr53c8xx_release if ncr_attach failed..
