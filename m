Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA25063
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 16:56:03 -0700
From: Helge Deller <deller@gmx.de>
Date: Wed, 1 Nov 2000 00:57:22 +0100
Content-Type: text/plain;
  charset="us-ascii"
To: Phillip Beal <pdbeal@bealz.net>, parisc-linux@thepuffingroup.com
References: <20001031184306.A25163@Ci271622-a.lusvil1.ky.home.com>
In-Reply-To: <20001031184306.A25163@Ci271622-a.lusvil1.ky.home.com>
Subject: Re: [parisc-linux] 735 and Thin Lan
MIME-Version: 1.0
Message-Id: <00110100572206.00343@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 01 November 2000 00:43, Phillip Beal wrote:
> Hey,
> 
> I've obtained two HP 735's and I'd like to try the linus port on them.
> I have compiled a kernel, but it never boots the nfsroot disk.  It has
> the same problem that the HP 755 that I've worked with.  However, it has
> a different ethernet connection.  The 735 has a thin lan connection.
> What network device should be used in the kernel to be able to use the
> thin lan adapter?  Here's the info on the Thin lan:
> 
> Outfield Core LAN (802.3) (10) at 0xf0826000 versions 0x9, 0x0, 0x72,
> 0x0, 0x0
> 
> Thanks,
> Phillip Beal
> S+LUG Vice-President

Hi Phillip,

I think the "Lasi ethernet"-driver (enabled by default in our configuration) 
should work on both of your boxes.

Helge.
