Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2881F4841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 06:50:34 -0700 (MST)
Message-ID: <3FAE4639.6030200@tiscali.be>
Date: Sun, 09 Nov 2003 13:50:49 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be> <20031108194804.GA28929@colo.lackof.org> <3FAD6B1A.6060605@tiscali.be>
In-Reply-To: <3FAD6B1A.6060605@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Ok Ok :)

Matthew you have right:

Joel Soete wrote:
> ----------><----------
> --- uaccess.h.orig    2004-04-20 19:58:08.000000000 +0200
> +++ uaccess.h-t2    2004-04-20 20:10:41.000000000 +0200
> @@ -42,8 +42,8 @@
>  #if BITS_PER_LONG == 32
>  #define LDD_KERNEL(ptr) __get_kernel_bad();
>  #define LDD_USER(ptr) __get_user_bad();
> -#define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,ptr)
> -#define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
> +#define STD_KERNEL(x, ptr) __put_kernel_asm64((u64)x,ptr)
> +#define STD_USER(x, ptr) __put_user_asm64((u64)x,ptr)
>  #else
>  #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
>  #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
> ----------><----------
I just test it and it seems to be a fix (among others):
hpalin:~# fdisk /dev/sda

Command (m for help): p

Disk /dev/sda: 4294 MB, 4294816768 bytes
133 heads, 62 sectors/track, 1017 cylinders
Units = cylinders of 8246 * 512 = 4221952 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          16       65937   f0  Linux/PA-RISC boot
/dev/sda2              17          48      131936   fd  Linux raid 
autodetect
/dev/sda3              49          79      127813   fd  Linux raid 
autodetect
/dev/sda4              80         993     3768422    5  Extended
/dev/sda5              80         496     1719260   fd  Linux raid 
autodetect
/dev/sda6             497         558      255595   fd  Linux raid 
autodetect
/dev/sda7             559         589      127782   fd  Linux raid 
autodetect
/dev/sda8             590         620      127782   fd  Linux raid 
autodetect
/dev/sda9             621         993     1537848   83  Linux

Can somebody re-test it and ci for me?

hth,
	Joel
