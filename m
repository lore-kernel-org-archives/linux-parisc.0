Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA04285
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 14:06:56 -0700
Sender: drepper@cygnus.com
To: Paul Bame <bame@noam.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Help with posix_types.h
References: <E13w62o-0006Pv-00@noam.fc.hp.com>
	<E13w8KW-0006ZW-00@noam.fc.hp.com>
	<m3u299dkkb.fsf@otr.mynet.cygnus.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 15 Nov 2000 13:08:01 -0800
In-Reply-To: Ulrich Drepper's message of "15 Nov 2000 12:52:52 -0800"
Message-ID: <m3lmuldjv2.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

This reminds me of something I talked to Cary Coutant about before.

You have certainly reserved a thread register in the ABI, right?  If
not, do it ASAP.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
