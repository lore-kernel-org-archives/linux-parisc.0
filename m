Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA29760
	for <parisc-linux@puffin.external.hp.com>; Sun, 8 Oct 2000 23:52:31 -0600
Date: Sun, 8 Oct 2000 22:53:24 -0700
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@thepuffingroup.com
Cc: debian-hppa@lists.debian.org
Subject: Re: file locking problems?
Message-ID: <20001008225324.C639@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20001008200047.B639@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001008200047.B639@tausq.org>; from randolph@tausq.org on Sun, Oct 08, 2000 at 08:00:48PM -0700
Sender: Randolph Chung <randolph@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>

> update-passwd (a Debian package) makes a call to lckpwdf. That fails
> with an "Invalid argument" message. It looks like lckpwdf internally uses
> fcntl() locking, so I tried that and it too fails with an "Invalid
> argument" message.  This happens both on nfs and local ext2 fs.
> Similar tests with flock() seems to work ok.

as it turns out, it looks like there's a glibc<->kernel mismatch. 
the kernel defines F_RDLCK as 1, and glibc has it defined as 0. dhd is
aware of this and say he'll look into fixing this later this week.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
