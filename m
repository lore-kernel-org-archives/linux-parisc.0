Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA11169
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 21:49:10 -0600
To: Claudiu Carter <ccarter@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] badblocks segmentation fault when using mke2fs -c 
In-Reply-To: Message from Claudiu Carter <ccarter@linuxcare.com>
   of "Fri, 25 Aug 2000 12:43:18 EDT." <39A6A225.408A2DF0@linuxcare.com>
References: <20000825124049.B13420@linuxcare.com>  
 <39A6A225.408A2DF0@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 Aug 2000 21:50:58 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000830035058.E695437D06@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Claudiu Carter writes...

> Hi, i just though all should know that mke2fs works, but badblocks doesn't.
> badblocks was run from the PA/Linux Development CD 0.1
> i ran 'mke2fs -c -v /dev/sda3'
> and got:
[snip]
> 
> Running command: badblocks -b 4096 -s /dev/sda3 237030
> do_page_fault() pid=21 command='badblocks'
[snip]

I just rebuilt e2fsprogs(available on the ftp site) and tried the above. It 
still does the same thing.

If I run badblocks with out the "-b blocksize" flag it works fine.

Hopefully someone knows what this means :)

-- 
Matt Taggart
taggart@fc.hp.com
