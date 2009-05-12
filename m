From: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: 2.6.30-rc5: reiserfs is broken on parisc (bisected)
Date: Tue, 12 May 2009 20:40:20 +0400
Message-ID: <a4423d670905120940r5de3eab7v7e8e92d89107b962@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Mahoney <jeffm-IBi9RG/b67k@public.gmane.org>,
	Al Viro <v
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <linux-parisc.vger.kernel.org>

Hi

ab17c4f02156c4f75d7fa43a5aa2a7f942d47201 is the first bad commit
(reiserfs: fixup xattr_root caching)

Kernel panics when init tries to remount rootfs (reiserfs) with
read-write access.
Read-only access works fine.

No more messages on the screen before panic.

Is it endianess related?
