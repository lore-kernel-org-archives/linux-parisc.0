Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44BEC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 13:05:21 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D99B4B00C; Tue, 18 Sep 2001 20:04:38 +0100 (BST)
Date: Tue, 18 Sep 2001 20:04:38 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: marka@sea.checkpoint.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing a native built kernel with 2.4.0 (.92 dist).
Message-ID: <20010918200438.T19441@linuxcare.com>
References: <20010918163015.Q19441@linuxcare.com> <Pine.WNT.4.33.0109181004310.3268-100000@nemo.dev.metainfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.WNT.4.33.0109181004310.3268-100000@nemo.dev.metainfo.com>; from marka@sea.checkpoint.com on Tue, Sep 18, 2001 at 10:10:43AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 18, 2001 at 10:10:43AM -0700, marka@sea.checkpoint.com wrote:
> Thanks for your help,
> 
> Ok, it turns out it is booting (the machine's so quiet it's hard to tell), and
> not 'freezing' per-say at 'branching to kernel entry point 0x00100000'.  It's
> simply not sending anything to ttyS0 any more after this point.  This seems to
> be the 'swapped serial ports' issue mentioned earlier on this list.

That should be fixed in the latest kernel source, please let us know
if it is still broken on your box.

Thanks,
  Richard
