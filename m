Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0AFB482C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 20:27:44 -0700 (MST)
Date: Wed, 24 Mar 2004 20:27:43 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Eric Sproul <esproul@ntelos.net>
Subject: Re: [parisc-linux] gdth driver on L2000
Message-ID: <20040325032743.GB7587@colo.lackof.org>
References: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
	<20040324173117.GA32052@colo.lackof.org>
	<1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
	<1080163275.23069.42.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1080163275.23069.42.camel@thunderbolt.oss.ntelos.net>
Cc: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 24, 2004 at 04:21:16PM -0500, Eric Sproul wrote:
> Maybe even though CONFIG_SMP=Y it is not including smp.h?

Do not enable CONFIG_SMP on 2.6 kernels. It doesn't work.

grant
