Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA02661
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 11:49:01 -0600
Received: from guinness.neep.com.au (reggae-10-62.nv.iinet.net.au [203.59.94.62])
	by urban.iinet.net.au (8.8.7/8.8.7) with ESMTP id BAA32557
	for <parisc-linux@thepuffingroup.com>; Thu, 24 Aug 2000 01:48:44 +0800
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id BAA27101
	for parisc-linux@thepuffingroup.com; Thu, 24 Aug 2000 01:48:37 +0800
Date: Thu, 24 Aug 2000 01:48:33 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] disk required?
Message-ID: <20000824014831.A25471@neep.com.au>
References: <Pine.BSO.4.21.0006281242220.12561-100000@mojo.calyx.net> <Pine.SOL.4.21.0008231324270.10246-100000@misty.cdf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.SOL.4.21.0008231324270.10246-100000@misty.cdf>; from apark@cdf.toronto.edu on Wed, Aug 23, 2000 at 01:28:14PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Andrew Park said:
> Hi,
> 
> Just wondering...  Is there a disk space requirement for booting from
> network (NFSROOT)?  Or could I do it without a disk?
> Thanks
> 
> Andrew Park

There isn't any requirement for locally attached devices to have
readable filesystems if you can boot and nfs-root from the network.

The local disks in my HP hold HP/UX on them, I just network boot to test
Linux kernels.  This is essentially the same thing as having no disk at
all as far as Linux is concerned.  =)

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                http://www.neep.com.au/

  "Just remember Basil, there's always someone worse off than yourself."
  "Oh, really?  I'd like to meet him ... I could do with a good laugh."
                 [ Sybil and Basil Fawlty, "Fawlty Towers" ]
