Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F671482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 09:25:32 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 488AEB00C; Thu, 21 Jun 2001 16:26:24 +0100 (BST)
Date: Thu, 21 Jun 2001 16:26:24 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Tom <tom@Alaskatech.org>
Cc: PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Something broke dselect/apt...
Message-ID: <20010621162624.M11438@linuxcare.com>
References: <Pine.LNX.4.33.0106210628050.23440-100000@devnull.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0106210628050.23440-100000@devnull.alaskatech.org>; from tom@Alaskatech.org on Thu, Jun 21, 2001 at 06:37:44AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 21, 2001 at 06:37:44AM -0800, Tom wrote:
> Unfortunately I wasn't watching the update - it's been a little too stable
> lately, I guess...
> 
> I ran apt-get update/upgrade on Monday - all working. Just ran it again
> this morning, had ~9 packages updated. All updated fine - no errors on the
> update - but then apt-* fails to work with "error while loading shared
> libraries - /usr/lib/libapt-pkg-libc6.2-3.so.3.2: undefined symbol:
> _cp_push_exception". Trying to run dselect gives "error while loading
> shared libraries: dselect: undefined symbol: __rethrow".
> 
> Has anyone noticed this yet and/or noticed something I may have goofed up?
> I believe there was a palo update in there, plus one of the libc6-*
> packages, but other than that I've no idea...

This is because you have picked up a new libstdc++3, but not a new apt.
We tried to update both together, but in the event, apt got delayed by
a day.  You need to grab the new apt.deb and install with dpkg -i.
It should appear in <ftp://ftp.debian.org:/debian/pool/main/a/apt/>
in a few hours.

Richard
