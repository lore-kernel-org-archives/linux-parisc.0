Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA14766
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Feb 2000 10:18:02 -0700
From: willy@thepuffingroup.com
Date: Wed, 23 Feb 2000 11:18:11 -0500
To: Dominik Kubla <dominik.kubla@uni-mainz.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 725/50 boot log...
Message-ID: <20000223111811.L9944@thepuffingroup.com>
References: <38B21539.A3D46D7@cln.etc.bc.ca> <20000222075737.A16202@uni-mainz.de> <20000222172949.A20225@uni-mainz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000222172949.A20225@uni-mainz.de>; from Dominik Kubla on Tue, Feb 22, 2000 at 05:29:49PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 22, 2000 at 05:29:49PM +0100, Dominik Kubla wrote:
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> RAMDISK: ext2 filesystem found at block 0
> RAMDISK: Loading 600 blocks [1 disk] into ram disk... |/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/done.
> kernel BUG at block_dev.c:411!
> kernel BUG at block_dev.c:411!

On the A180, it continues from here:

RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 600 blocks [1 disk] into ram disk... done.
kernel BUG at block_dev.c:411!
kernel BUG at block_dev.c:411!
VFS: Mounted root (ext2 filesystem).
tty_open

(and that's the Image freshly downloaded from the ftp site).
You may wish to try to trace this further yourself...
