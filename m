From: Roland McGrath <roland@redhat.com>
Subject: Re: [PATCH] compat_sys_ptrace conversions for parisc
Date: Tue, 26 Aug 2008 14:09:58 -0700 (PDT)
Message-ID: <20080826210958.2F68A154233@magilla.localdomain>
References: <200808242026.06295.deller@gmx.de>
	<200808242033.25481.deller@gmx.de>
	<20080825165231.GA13428@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
To: Christoph Hellwig <hch@lst.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: Christoph Hellwig's message of  Monday, 25 August 2008 18:52:31 +0200 <20080825165231.GA13428@lst.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This should probably get a little review from Rland, I've added him to
> the Cc list.  Although I suspect splitting this into at least two
> patches for compat_sys_ptrace vs the rest might make sense.

For the machines where I've done this work, I've certainly been well-served
by breaking it into many smaller incremental patches.  That would make the
meat of each patch far easier to read than this one big patch is.

It seems odd to have user_disable_single_step call ptrace_disable rather
than vice versa.  Otherwise, off hand I don't see anything particularly
suspect in the patch, but I'll admit I didn't look too close because the
one big diff is a pain to read.


Thanks,
Roland
