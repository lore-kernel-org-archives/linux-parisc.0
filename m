Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE9FE4855
	for <parisc-linux@parisc-linux.org>;
	Wed,  4 Feb 2004 11:56:29 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i14IuTa09321; Wed, 4 Feb 2004 13:56:29 -0500
Subject: Re: [parisc-linux] Kernel 2.6 autobuilds discontinued
From: James Bottomley <James.Bottomley@steeleye.com>
To: bame@hp.com
In-Reply-To: <20040204182036.B9F9973819@fc.hp.com>
References: <20040204182036.B9F9973819@fc.hp.com>
Content-Type: text/plain
Date: 04 Feb 2004 13:56:21 -0500
Message-Id: <1075920982.1756.99.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 2004-02-04 at 13:20, bame@hp.com wrote:
> Kernel autobuilds for 2.6 at http://cvs.parisc-linux.org/download/linux-2.6/
> have been discontinued.  Patch creation will continue as usual.
> 
> I've never been able to build 64-bit kernels and now can't build
> 32-bit ones either since the kernel demands a newer tool chain than is
> available for woody and we need that box to stay "stable".  If someone
> has appropriate woody tool chain debs I'll be happy to re-start
> those builds!

This was a problem with debugging code being accidentally left in the
Makefile.  The builds should run again on woody, if you want to restart
them.

James
