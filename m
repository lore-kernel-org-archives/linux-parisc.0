Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA29053
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Sep 2000 04:45:24 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel1.hp.com (Postfix) with ESMTP id C1A20A3
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Sep 2000 04:46:16 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Sep 2000 04:47:54 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000927104754.570BC381CD@carmen.fc.hp.com>
Subject: [parisc-linux] new debs and nfsroot tarball
List-ID: <linux-parisc.vger.kernel.org>

I have built native dynamic versions of the following Debian woody packages,

cpio_2.4.2-32_hppa.deb
debhelper_2.1.11_all.deb
findutils_4.1-40_hppa.deb
grep_2.4.2-1_hppa.deb
gzip_1.2.4-33_hppa.deb
hostname_2.07_hppa.deb
ldso_1.9.11-9_hppa.deb
sed_3.02-6_hppa.deb
sysvinit_2.78-4_hppa.deb
tar_1.13.17-2_hppa.deb
texinfo_4.0-4_hppa.deb

I have added them to the repository at,

http://puffin.external.hp.com/debian-hppa

Some of these we only had in static/cross-compiled form and some are new. I 
have added the above packages to the nfsroot tarball and placed it at,

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-20000927.tar.g
z

There are still a few things that have not been rebuilt native/dynamic. I hope 
to do those later this week.

-- 
Matt Taggart
taggart@fc.hp.com
