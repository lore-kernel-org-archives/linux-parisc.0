Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4308482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Aug 2001 12:47:20 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7028CB00C; Fri, 10 Aug 2001 19:48:18 +0100 (BST)
Date: Fri, 10 Aug 2001 19:48:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010810194818.I23676@linuxcare.com>
References: <001f01c1206d$56b98f10$727ba8c0@vaio> <3B732C64.6D2E622F@cup.hp.com> <20010810091516.X23676@linuxcare.com> <3B742096.29E3F963@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B742096.29E3F963@cup.hp.com>; from gururaj@cup.hp.com on Fri, Aug 10, 2001 at 10:57:43AM -0700
Subject: [parisc-linux] Re: [Linux-ia64] Installation.
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 10, 2001 at 10:57:43AM -0700, Gururaj Ananthateerta wrote:
> My apologies, I realised that I have posted my question on ia-64 list, but it
> was too late.
> 
> Thanks for the comphrensive description.
> I have one more question.
> I have an external SCSI CDROM. I guess I am not able to boot through this.
> Do you think this should be a problem.

I would expect you to be able to boot from it.  Does it show up if
you do a SEA search?  Alternatively, you can do a network boot to
start the installation, then read everything else from the CD or
the network, as described in the README on the CD.

Richard
