Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF48D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 12:11:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15dyC0-0007Yz-00
	for parisc-linux@lists.parisc-linux.org; Mon, 03 Sep 2001 19:11:28 +0100
Date: Mon, 3 Sep 2001 19:11:28 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010903191128.L5126@parcelfarce.linux.theplanet.co.uk>
References: <200109031808.MAA23023@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109031808.MAA23023@puffin.external.hp.com>; from willy@puffin.external.hp.com on Mon, Sep 03, 2001 at 12:08:37PM -0600
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux willy
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 12:08:37PM -0600, Matthew Wilcox wrote:
> Log message:
> Unlock the lock, not the device!

Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/drivers.c,v
retrieving revision 1.22
diff -u -p -r1.22 drivers.c
--- drivers.c   2001/09/01 08:30:49     1.22
+++ drivers.c   2001/09/03 18:08:14
@@ -248,7 +248,7 @@ struct parisc_device *alloc_pa_dev(unsig
 
        num_devices++;
 
-       write_unlock(&pa_dev);
+       write_unlock(&pa_lock);
 
        return dev;
 }

Thanks to Ben Collins for this patch.

-- 
Revolutions do not require corporate support.
