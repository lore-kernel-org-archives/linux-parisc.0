From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: 2.6.30-rc5: reiserfs is broken on parisc (bisected)
Date: Tue, 12 May 2009 13:20:17 -0400
Message-ID: <4A09AFD1.5090604@suse.com>
References: <a4423d670905120940r5de3eab7v7e8e92d89107b962@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Kernel Testers List <kernel-testers@vger.kernel.org>,
	linux-parisc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	reiserfs-devel@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a4423d670905120940r5de3eab7v7e8e92d89107b962@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander Beregalov wrote:
> Hi
> 
> ab17c4f02156c4f75d7fa43a5aa2a7f942d47201 is the first bad commit
> (reiserfs: fixup xattr_root caching)
> 
> Kernel panics when init tries to remount rootfs (reiserfs) with
> read-write access.
> Read-only access works fine.
> 
> No more messages on the screen before panic.
> 
> Is it endianess related?

No, not at all. There was a problem with the xattr code if the kernel
was built with xattrs disabled. It assumed that
REISERFS_SB(s)->xattr_root would be available, which isn't the case when
xattrs aren't enabled. Part of it has been cleaned up in -git1, and I've
sent Al some additional patches to fix the rest of it up.

There's a thread called "reiserfs xattr fixups" that contains 4 patches.
The patch marked with * is the one I believe will fix your problem.

- - reiserfs: cleanup ifdefs
- - reiserfs: deal with NULL xattr root w/ xattrs disabled *
- - reiserfs: fixup perms when xattrs are disabled
- - reiserfs: allow exposing privroot w/ xattrs enabled

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkoJr9EACgkQLPWxlyuTD7JbfACfSV+WiMxReRCr/YRDT8IBf7M8
jVkAn3fhf3R1i5cyi/YJ+vtO/WTd6Lre
=90Xq
-----END PGP SIGNATURE-----
