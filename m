Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id D27F9482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 10:39:00 -0600 (MDT)
To: "Christian Knoch" <ChristianK@datco.com.ar>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HELP ME PLEASE - d220 Install problem 
In-Reply-To: Message from "Christian Knoch" <ChristianK@datco.com.ar>
   of "Thu, 23 Aug 2001 10:48:43 -0300." <92AD79D83589314D821A57429B49E54A479CE7@w2kexchange>
References: <92AD79D83589314D821A57429B49E54A479CE7@w2kexchange> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 23 Aug 2001 10:36:00 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010823163600.53CD237CD9@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Christian Knoch" writes...

> how to write a debian parisc iso using easy cd creator
> how many iso i need?? step by step

1.) Download the iso.gz image.
2.) Run md5sum and compare the result with the one on the ftp site
3.) gunzip the image
4.) Use your CD burning software to burn the raw image directly
5.) Try booting the CD, if it doesn't boot post only the relevant console
    messages to the mailing list.

HTH,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
