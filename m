Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD7B6482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 03:50:34 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B511FB007; Tue,  5 Jun 2001 10:46:55 +0100 (BST)
Date: Tue, 5 Jun 2001 10:46:55 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: djweis@sjdjweis.com
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
Message-ID: <20010605104655.H25745@linuxcare.com>
References: <Pine.LNX.4.21.0106041410590.20217-100000@oliver.internal.sjdjweis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0106041410590.20217-100000@oliver.internal.sjdjweis.com>; from djweis@sjdjweis.com on Mon, Jun 04, 2001 at 02:16:49PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 04, 2001 at 02:16:49PM -0500, djweis@sjdjweis.com wrote:
> So now, what major and minor should /dev/ttyB have to
> function? /dev/console is 5 1 on my nfsroot.

My understanding of the pdc console is that it is output only,
used only until a real console device is available, and so wont
work as a linux console.  Hopefully someone will correct me if I'm
wrong.

> Good job getting it to work this well, especially since it's listed as
> untested! Also, the LCD on the front doesn't seem to do anything. What
> needs to happen for that to work?

I turned off LCD support in the release kernels because of reports
that it was causing problems on some systems.  See
<http://bugs.parisc-linux.org/db/10/104.html>.  You can turn it
back on if you build your own kernel.

Richard
