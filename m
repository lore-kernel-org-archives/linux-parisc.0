Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2834D483E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Sep 2003 12:58:12 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8RIw7q27686;
	Sat, 27 Sep 2003 14:58:07 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk>
References: <1064634188.641.27.camel@laptop.bradetich.net>
	<1064677551.2002.20.camel@mulgrave>
	<20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 27 Sep 2003 13:58:06 -0500
Message-Id: <1064689088.2002.188.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
Sender: parisc-linux-admin@lists.parisc-linux.org
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
