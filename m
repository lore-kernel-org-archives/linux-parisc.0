Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AD72482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Jun 2001 07:39:02 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AB79AB007; Wed, 13 Jun 2001 14:34:42 +0100 (BST)
Date: Wed, 13 Jun 2001 14:34:42 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: CHS <chs@23.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New list member..
Message-ID: <20010613143442.K16532@linuxcare.com>
References: <Pine.LNX.4.30.0106121514010.23761-100000@methlab.23.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.30.0106121514010.23761-100000@methlab.23.org>; from chs@23.org on Tue, Jun 12, 2001 at 03:19:46PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 12, 2001 at 03:19:46PM -0700, CHS wrote:
> 
> Hello all. Just wanted to say hello. I've been working with linux for
> about 7 years now, mainly with the slackware and redhat distributions.
> This weekend I picked up a 712/80 for free, and after getting a CDROM
> drive working on it (long story), managed to go through the single easiest
> linux install in my entire life. Keep in mind I've never even touched an
> HP PA-RISC machine until this weekend. So a big hearty kudos to you guys!
> I had a couple questions though:
> 
> 1.) The machine seems to work generally pretty OK, except that I get
> kernel panics fairly often. This did not hinder the install at all though.
> any ideas?

You don't say if you are serial or graphical (sti) console based.
I certainly wouldn't expect kernel panics "fairly often" with a
serial console.  For sti console, there are some known issues, for
example, hitting <escape> in vi tends to crash the kernel.  sti console
is much less tested than serial also.  The vi problem is fixed in our
latest kernel source, and you can work round it by changing your terminal
type (from TERM=linux to TERM=vt100, iirc).

If you are sti console based then it is painful, but if you could copy
down the register dump (not the stack dump, most of which will have
scrolled off the screen), then I might be able to tell you more.
If you are serial based, you should be able to capture the output
easily enough.

Richard
