Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id F109D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 11:44:47 -0700 (MST)
Date: Mon, 24 Mar 2003 11:44:47 -0700
To: Andreas Schwab <schwab@suse.de>
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on parisc-linux 2.5 kernel??
Message-ID: <20030324184447.GA26572@uswest.net>
References: <1048493134.8777.22.camel@beavis.ybsoft.com> <jeptohumcp.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <jeptohumcp.fsf@sykes.suse.de>
From: rbrad@uswest.net (Ryan Bradetich)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> hppa is using function descriptors, AFAIK.  So you'll have to do something
> similar to what ia64 and ppc64 are doing.

Thanks much for the reply!  I will investigate the function descriptors and
see if that accounts for the different in offsets.  If so, I just need to
figure out which side needs to be fixed :)

Thanks!

- Ryan

> Andreas.
> 
> -- 
> Andreas Schwab, SuSE Labs, schwab@suse.de
> SuSE Linux AG, Deutschherrnstr. 15-19, D-90429 N?rnberg
> Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
> 

-- 
