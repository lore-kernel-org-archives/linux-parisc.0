Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29A994A19
	for <parisc-linux@parisc-linux.org>; Mon, 12 Mar 2001 12:13:30 -0700 (MST)
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] libpng test program causes page fault 
In-Reply-To: Message from Alan Modra <alan@linuxcare.com.au>
   of "Sun, 11 Mar 2001 00:40:41 EST." <Pine.LNX.4.21.0103110024490.23407-100000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0103110024490.23407-100000@front.linuxcare.com.au> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Mar 2001 12:16:02 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010312191602.E94E537CB4@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra writes...

> Your IOAQ indicates the fault happened in libz.  48210228 occurs in my
> libz in __do_global_ctors_aux, so it smells like your libz is bad,
> ie. built with bad crt[in].o.

Yep, I rebuilt/installed libz and then it built fine. I uploaded the new zlib 
and libpng stuff to pehc.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
