From: James Bottomley <James.Bottomley@steeleye.com>
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
Date: 27 Sep 2003 13:58:06 -0500
Message-ID: <1064689088.2002.188.camel__30466.3534313024$1416622818$gmane$org@mulgrave>
References: <1064634188.641.27.camel@laptop.bradetich.net>
	<1064677551.2002.20.camel@mulgrave>
	<20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, 2003-09-27 at 13:37, Matthew Wilcox wrote:
> On Sat, Sep 27, 2003 at 10:45:50AM -0500, James Bottomley wrote:
> > This should fix the panic, but it simply detaches correctly.
> 
> We both missed it.  This is why it's panicing:
> 
>         host = ncr_attach(&zalon7xx_template, unit, &device);
>         if (!host)
>                 goto fail;
>  fail:
>         ncr53c8xx_release(host);
>         return error;
> 
> ie we're calling ncr53c8xx_release(NULL) so both your & my patch fail
> to fix the problem.  This looks best to me:

No, I fixed that...that was changed to goto out; in my patch, and out
was just before the return (i.e. no longer do the release).

James
