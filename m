Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id D83CA482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 07:34:07 -0600 (MDT)
To: "Marc Eisenbarth" <Marc_Eisenbarth@baylor.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 Progress 
In-Reply-To: Message from "Marc Eisenbarth" <Marc_Eisenbarth@baylor.edu>
   of "Sun, 08 Apr 2001 12:32:56 CDT." <BFEMJCMIKMCDNBPBHLNNKECOCBAA.Marc_Eisenbarth@baylor.edu>
References: <BFEMJCMIKMCDNBPBHLNNKECOCBAA.Marc_Eisenbarth@baylor.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Apr 2001 07:36:42 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010409133642.1853737CDB@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Marc Eisenbarth" writes...

> What is the statis for a Linux install for an HP C180 Visualize? I tried to
> install 0.5, but it seems to hang and will not accept input from the
> keyboard after the cd boots up.

IIRC, the C180 requires fixes that are not in the kernel on the 0.5 iso. 
Either build a new kernel(and boot from an nfsroot root), or wait for a new 
iso.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
