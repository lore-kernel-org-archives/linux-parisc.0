Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA16639
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Apr 1999 17:18:23 -0600
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id QAA19553
	for <parisc-linux@thepuffingroup.com>; Fri, 30 Apr 1999 16:17:59 -0700 (PDT)
Sender: shaver@netscape.com
Message-ID: <372A3A83.84EDABE9@mozilla.org>
Date: Fri, 30 Apr 1999 19:19:31 -0400
From: Mike Shaver <shaver@mozilla.org>
MIME-Version: 1.0
To: Alex deVries <adevries@redhat.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linker problems
References: <Pine.LNX.3.96.990430190529.10592L-100000@devserv.devel.redhat.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> make: *** [vmlinux] Aborted (core dumped)
> make: *** Deleting file `vmlinux'
> 
> That's remarkably gross, since it indicates that there's a problem with
> the linker.  I'm not quite sure what it is, but the problem seems to come
> up when it's processing lib/libc.a.
> 
> I think that's a good thing for someone to look into.

IIRC, Nat says it's a matter of popping into gdb, spotting the crash
location, fixing the obvious double-free and recompiling.

Mike

-- 
372738.81 362322.32
