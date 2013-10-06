From: John David Anglin <dave.anglin@bell.net>
Subject: New udev package requires CONFIG_DEVTMPFS
Date: Sun, 6 Oct 2013 12:46:50 -0400
Message-ID: <BLU0-SMTP155C9515FA7D7CC729693B97120@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I uploaded new consolekit (0.4.6-3) and systemd/udev (204-5) builds to  
the parisc Debian archive.
The new version of consolekit breaks the old version of udev.  The new  
version of udev requires
the running kernel to have been built with CONFIG_DEVTMPFS.

So, I advise not upgrading unless you have primary and backup kernels  
built with CONFIG_DEVTMPFS.

This option is not selected in at least some parisc default configs.

Dave
--
John David Anglin	dave.anglin@bell.net



