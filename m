Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF9FF482B
	for <parisc-linux@parisc-linux.org>; Tue, 25 Sep 2001 18:18:58 -0600 (MDT)
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Trace/breakpoint trap 
In-Reply-To: Message from Richard Allen <ra@hp.is>
   of "Tue, 25 Sep 2001 23:42:25 -0000." <20010925234225.A18261@hp.is>
References: <20010925234225.A18261@hp.is> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Sep 2001 18:18:57 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010926001857.1BAF937C8D@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Allen writes...

> Here's a wild one:
> 
> bofh:~/rpm-4.0.3/rpmdb# make
> Trace/breakpoint trap
> bofh:~/rpm-4.0.3/rpmdb# echo $?
> 133
> bofh:~/rpm-4.0.3/rpmdb#

Try it with strace and post the results. Was anything printed on the console?

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
