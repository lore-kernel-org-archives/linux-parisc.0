Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED008482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 07:18:56 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 353F0B00C; Mon, 10 Sep 2001 14:19:07 +0100 (BST)
Date: Mon, 10 Sep 2001 14:19:07 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Boyan Lazarov <bsl@mek.dtu.dk>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Installing on Apollo 735
Message-ID: <20010910141907.X19441@linuxcare.com>
References: <3B9BA35D.9A02DD98@mek.dtu.dk> <20010910083204.P19441@linuxcare.com> <3B9C73CF.412C929@mek.dtu.dk> <20010910103658.T19441@linuxcare.com> <3B9CAC65.E1096C44@mek.dtu.dk> <20010910134134.V19441@linuxcare.com> <3B9CB844.E657991F@mek.dtu.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B9CB844.E657991F@mek.dtu.dk>; from bsl@mek.dtu.dk on Mon, Sep 10, 2001 at 02:55:32PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 10, 2001 at 02:55:32PM +0200, Boyan Lazarov wrote:
> The cd-rom is on the scsi bus , can this be the problem.

It shouldn't be a problem, but you could try mounting the CD on
a server and then installing via nfs or http, so only one device is
active on the the scsi bus.

> At the beginning the kernel gives message for the devices and it
> recognizes two scsi 
> 3. Outfield Core SCSI (10) at 0xf0825000, versions 0x9, 0x0, 0x71, 0x0,
> 0x04

That is the one you are using.

> 9. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c, 0x0,
> 0x0
> but the second one is not configured.

Right, it is not supported in the kernel atm.

Richard
