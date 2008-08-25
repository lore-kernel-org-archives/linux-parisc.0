From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] compat_sys_ptrace conversions for parisc
Date: Mon, 25 Aug 2008 13:11:03 -0400
Message-ID: <20080825171103.GB28485@phobos.i.cabal.ca>
References: <200808242026.06295.deller@gmx.de> <200808242033.25481.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Christoph Hellwig <hch@lst.de>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200808242033.25481.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 24, 2008 at 08:33:25PM +0200, Helge Deller wrote:
> This patch does the compat_sys_ptrace conversion for parisc.
> In addition it does convert the parisc ptrace code to use the
> architecture-independent ptrace infrastructure instead of own coding.
> 

This sounds like it should be two seperate patches, for at least the
reason of making bisecting easier should there be a problem.
