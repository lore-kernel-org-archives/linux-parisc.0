From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Thu, 30 Apr 2009 18:27:03 -0400
Message-ID: <20090430222703.GB18899@bombadil.infradead.org>
References: <49FA1AA1.3060104@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Thibaut VARENE <varenet@debian.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49FA1AA1.3060104@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 30, 2009 at 11:39:45PM +0200, Helge Deller wrote:
> This "fix ldcw assembler" patch below is really an old one now, but sadly it never got applied.
> 
> I just tried it again. Without this patch I always see login-problems when ssh-ing into
> my parisc box. The very first time sshd just drops the connection (Connection closed by remote host).
> With this patch I didn't faced this problem again.
> 
> I'm wondering, if not other userspace problems suddenly go away then as well,
> e.g. the uid/gid issues others are seeing:
> http://marc.info/?l=linux-parisc&m=121114269417948&w=2
> 
> Kyle, please apply.
> 

gotcha.
