Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6CD3482A
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 14:30:58 -0600 (MDT)
Sender: drepper@cygnus.com
To: Andreas Thienemann <andreas@thienemann.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Even more glibc problems...
References: <Pine.LNX.4.10.10104252215090.25358-100000@gate.ixs.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 25 Apr 2001 13:29:55 -0700
In-Reply-To: Andreas Thienemann's message of "Wed, 25 Apr 2001 22:18:04 +0200 (CEST)"
Message-ID: <m3ae54iuyk.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Andreas Thienemann <andreas@thienemann.net> writes:

> Now, doing a make check after building the glibc fails with the following
> remark:
> 
> make[2]: *** [/mnt/lfs/usr/src/glibc-build/math/test-float.out] Error 1
> make[2]: Leaving directory `/mnt/lfs/usr/src/glibc/math'
> make[1]: *** [math/tests] Error 2

Why don't you read math/README.libm-test?

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
