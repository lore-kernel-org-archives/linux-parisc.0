From: Helge Deller <deller@gmx.de>
Subject: Re: New hppa kernel packages uploaded (3.10.11, aka 3.10-3) to parisc
 archives
Date: Sun, 13 Oct 2013 21:52:50 +0200
Message-ID: <525AFA12.2000002@gmx.de>
References: <BLU0-SMTP850C7B9645BBBC4DF76FD0971C0@phx.gbl> <5256AFF5.8080805@landcomp.net> <BLU0-SMTP27179D0C2057664D913C74971F0@phx.gbl> <52578D25.6010102@landcomp.net> <BLU0-SMTP337F2FF2A00CABB1AD2BA2971F0@phx.gbl> <525ACD4D.4060108@landcomp.net> <BLU0-SMTP943EBAB2046BE47061811197190@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>,
	Dave Land <xmechanic@landcomp.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP943EBAB2046BE47061811197190@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

On 10/13/2013 06:59 PM, John David Anglin wrote:
> To get devtmpfs you need a kernel built with CONFIG_DEVTMPFS.  I think the Debian kernels in the archive
> have this.  However, at least some of the default parisc kernel configs miss this option.

You are correct.
I just tested shortly the 712_defconfig and c3000_defconfigs, and both are missing CONFIG_DEVTMPFS.

What about DEVTMPFS_MOUNT? Is it needed as well? 
(Automount devtmpfs at /dev, after the kernel mounted the rootfs (DEVTMPFS_MOUNT) [N/y/?] (NEW))

I think it makes sense to update the defconfigs.
What else do you know might be missing?

Helge
