Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC924482C
	for <parisc-linux@parisc-linux.org>; Wed,  5 Dec 2001 14:52:33 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id E3716B00C; Wed,  5 Dec 2001 21:52:49 +0000 (GMT)
Date: Wed, 5 Dec 2001 21:52:49 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Paul Bame <bame@riverrock.org>
Cc: parisc-linux@parisc-linux.org, bame@www.riverrock.org
Subject: Re: [parisc-linux] itimer/ntpdate 64-bit patch
Message-ID: <20011205215249.B10229@linuxcare.com>
References: <m16BgJt-000OuYC@bame.riverrock.org> <m16Bgow-000OucC@bame.riverrock.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m16Bgow-000OucC@bame.riverrock.org>; from bame@riverrock.org on Wed, Dec 05, 2001 at 11:31:02AM -0700
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

On Wed, Dec 05, 2001 at 11:31:02AM -0700, Paul Bame wrote:
> 
> On Helge's suggestion I stopped freeing bootmem, and the problem
> no longer manifests.  No more time to work on it.  I won't commit
> the syscall wrapper patch for now.

I tried zero-ing bootmem instead of freeing it, in the hope that I'd
get a more useful crash if it tried to execute code there, but it
didn't fail.  But then, I didn't try freeing bootmem with the itimer
wrapper, so maybe my box doesn't have the problem anyway.

Richard
