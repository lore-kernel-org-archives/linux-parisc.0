Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA24647
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 23:30:02 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39CC4001.50E72330@uswest.net>
Date: Fri, 22 Sep 2000 23:30:41 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Erik Paulson <epaulson@upl.cs.wisc.edu>, grundler@cup.hp.com
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and ccio-dma
References: <20000921201241.C28365@data.upl.cs.wisc.edu>
Content-Type: multipart/mixed;
 boundary="------------DC7AC919A57FF5003A3725B8"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------DC7AC919A57FF5003A3725B8
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Erik & Grant,

I think I have finally tracked this problem down... I don't think it is a bug
in either the ccio-dma or the sym53c8xx driver.... I believe it is a sizing
issue with the IO PDIR in the ccio-dma.  I spent some time last week
increasing the density of the IO PDIR by 4x ... it looks like I still have some
work to do :)

I increased the the IO PDIR ratio to main memory by 4x and I can
successfully format a 4G partition in my C200+.  (When I bumped
the IO PDIR ratio by 2x, is still had problems...)

Erik ... I've attached a small patch for you to try and see if it works for
you.

Thanks,

- Ryan


> Hi,
>         Using the CVS kernel on a C100 I'm seeing it die with an out-of-mapping
> resources error from ccio-dma.c. It looks like there's been some active
> development there about a week ago, but it's not helping my machine. The
> quickest way for me to bring it about is to try and use mke2fs, but just
> mounting the CD and running a few commands will oftentimes do the trick.
>
> How can I help debug this? There's really no useful information provided by
> the printk now - is there some sort of debugging info I could be collecting,
> or would a backtrace help?
>
> Thanks
>
> -Erik
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

--------------DC7AC919A57FF5003A3725B8
Content-Type: text/plain; charset=us-ascii;
 name="ccio-dma.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ccio-dma.patch"

Index: ccio-dma.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/ccio-dma.c,v
retrieving revision 1.10
diff -u -p -u -r1.10 ccio-dma.c
--- ccio-dma.c	2000/09/15 00:57:14	1.10
+++ ccio-dma.c	2000/09/23 05:26:51
@@ -200,7 +200,7 @@ struct ccio_device {
 
 
 /* Ratio of Host MEM to IOV Space size */
-STATIC u_long ccio_mem_ratio = 16;
+STATIC u_long ccio_mem_ratio = 4;
 STATIC struct ccio_device *ccio_list = NULL;
 
 /**************************************************************

--------------DC7AC919A57FF5003A3725B8--
