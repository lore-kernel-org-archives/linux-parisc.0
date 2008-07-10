From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] fix comment in Light-weight-syscall code
Date: Thu, 10 Jul 2008 16:35:24 -0400
Message-ID: <20080710203524.GB31987@phobos.i.cabal.ca>
References: <200807102204.15886.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200807102204.15886.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 10, 2008 at 10:04:15PM +0200, Helge Deller wrote:
> The comment for the lws-atomic system call userspace helper 
> function mentions r22 and r23 as input registers, but I couldn't 
> find any usage of those registers in the code.
> This patch fixes this and corrects another small typo as well.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 

If Carlos thinks this is OK, it's OK by me.
