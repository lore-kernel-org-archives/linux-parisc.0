Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 374A7482C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 20:26:41 -0700 (MST)
Date: Wed, 24 Mar 2004 20:26:39 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Eric Sproul <esproul@ntelos.net>
Subject: Re: [parisc-linux] gdth driver on L2000
Message-ID: <20040325032639.GA7587@colo.lackof.org>
References: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
	<20040324173117.GA32052@colo.lackof.org>
	<1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
Cc: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 24, 2004 at 02:56:49PM -0500, Eric Sproul wrote:
> Grant,
> I'm working with Debian's 2.6.4 sources, but the gdth driver must be
> unchanged since the patch applies cleanly.  Thanks!

good

> All,
> Does anyone else who is running Debian have a working config I could use
> to start from?

Grab a500_defconfig from 
	http://cvs.parisc-linux.org/linux-2.6/arch/parisc/configs

that works.

grant
