Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA11592
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 22:10:52 -0600
To: Andrew Park <apark@cdf.toronto.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] gcc make failures 
In-Reply-To: Message from Andrew Park <apark@cdf.toronto.edu>
   of "Sat, 19 Aug 2000 02:51:03 EDT." <Pine.LNX.4.21.0008190244530.18573-100000@kirin.cdf>
References: <Pine.LNX.4.21.0008190244530.18573-100000@kirin.cdf> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 Aug 2000 22:12:40 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000830041240.939D537D06@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Andrew Park writes...

> Hi, all
> 
> Just wondering ... I'm trying to build gcc, but although I passed in
> 
> 	make LIBGCC2_INCLUDES=-I$DEST/include

Rather than do that I would use a "--with-headers=$DEST/include" flag in the 
configure phase.

Or if you're lazy or not interesting in building it yourself you could just 
grab an i386-linux cross compiler tarball from,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tgz


-- 
Matt Taggart
taggart@fc.hp.com
