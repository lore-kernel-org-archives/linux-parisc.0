Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA25308
	for <parisc-linux@puffin.external.hp.com>; Sun, 8 Oct 2000 21:52:11 -0600
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@thepuffingroup.com, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] file locking problems?
References: <20001008200047.B639@tausq.org>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 08 Oct 2000 23:52:42 -0400
In-Reply-To: Randolph Chung's message of "Sun, 8 Oct 2000 20:00:48 -0700"
Message-ID: <87g0m6hdrp.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Randolph Chung <randolph@tausq.org> writes:

> update-passwd (a Debian package) makes a call to lckpwdf. That fails
> with an "Invalid argument" message. It looks like lckpwdf internally uses
> fcntl() locking, so I tried that and it too fails with an "Invalid
> argument" message.  This happens both on nfs and local ext2 fs.
> Similar tests with flock() seems to work ok.

Lots of things report this actually - if you look in your log files
you'll see lots of "utmp file is locked/read" - also in bootup
messages there will be a "can't lock <whatever>".

I have a feeling this might just be generally broken in the revision
of the kernel we're using, though it could be a problem with LFS in
our glibc if it is trying to use fcntl64().

I suspect that our LFS stuff is generally broken (lseek64() is, at
least) and plan to investigate further on Tuesday.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
