Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6960B482A
	for <parisc-linux@parisc-linux.org>; Mon, 29 Jul 2002 20:10:46 -0600 (MDT)
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Booting Debian on an HP C180 workstation 
In-Reply-To: Message from Derek Engelhaupt <derekengelhaupt@rocketmail.com>
   of "Mon, 29 Jul 2002 19:00:30 PDT." <20020730020030.40187.qmail@web12502.mail.yahoo.com>
References: <20020730020030.40187.qmail@web12502.mail.yahoo.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 29 Jul 2002 20:10:40 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020730021040.99A7737E97@carmen.fc.hp.com>
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

Derek Engelhaupt writes...

> I have dowloaded the Debian
> palinux-0.9.3.iso.gz from http://ftp.parisc-linux.org/cd-images/ to my
> Win2k PC at home with CD burner.  Here comes the stupid part....how the
> hell do I burn it to the CD and get it to boot on my C180?  Looking for
> as much detail as possible since I am VERY new to this.  Thanks.

 - gunzip the image
 - run md5sum and compare the result with the published value to make sure
    the image is ok
 - use your cd burner to burn the "raw" image. You may need to play with the
    options to get it right. You're trying to get the software to just burn
    the image *as is* without messing with it. Some software tries to be 
smart
    and "help" you by messing with the filesystem or the bootable frontend
    part. You don't want that so turn it off.
 - Load the burned cd in the c180
 - From firmware "sea"rch for bootable devices. If you burned the cd right
    it should show up.
 - boot from the cd, install debian, have a nice $BEVERAGE


-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
