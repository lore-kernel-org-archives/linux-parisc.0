Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED819483E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Sep 2003 12:37:56 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3Jx6-0006Yu-2i; Sat, 27 Sep 2003 19:37:56 +0100
Date: Sat, 27 Sep 2003 19:37:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Message-ID: <20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk>
References: <1064634188.641.27.camel@laptop.bradetich.net> <1064677551.2002.20.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1064677551.2002.20.camel@mulgrave>
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

On Sat, Sep 27, 2003 at 10:45:50AM -0500, James Bottomley wrote:
> This should fix the panic, but it simply detaches correctly.

We both missed it.  This is why it's panicing:

        host = ncr_attach(&zalon7xx_template, unit, &device);
        if (!host)
                goto fail;
 fail:
        ncr53c8xx_release(host);
        return error;

ie we're calling ncr53c8xx_release(NULL) so both your & my patch fail
to fix the problem.  This looks best to me:

+++ drivers/scsi/ncr53c8xx.c    27 Sep 2003 18:31:13 -0000
@@ -8855,11 +8855,14 @@ struct Scsi_Host * __init ncr_attach(str
 
 int ncr53c8xx_release(struct Scsi_Host *host)
 {
-       struct host_data *host_data = (struct host_data *)host->hostdata;
+       struct host_data *host_data;
 #ifdef DEBUG_NCR53C8XX
        printk("ncr53c8xx: release\n");
 #endif
-       if (host_data->ncb)
+       if (!host)
+               return 1;
+       host_data = (struct host_data *)host->hostdata;
+       if (host_data && host_data->ncb)
                ncr_detach(host_data->ncb);
        return 1;
 }

and it does fix the problem.  Maybe it's too much checking, but I'm not
interested in tracking down bugs like this again ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
