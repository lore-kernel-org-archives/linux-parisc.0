Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA2E04903
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  4 May 2004 14:11:23 -0600 (MDT)
Date: Tue, 4 May 2004 14:11:22 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] palo-1.4 broken on 32bit ?
Message-ID: <20040504201122.GA32258@colo.lackof.org>
References: <200405042136.28626.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200405042136.28626.deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, May 04, 2004 at 09:36:28PM +0200, Helge Deller wrote:
> Hi all,
> 
> after apt-get upgrading to palo_1.4_hppa.deb it seems, that palo-1.4 isn't able any longer to boot up a 32bit Linux kernel on a 32bit Machine.
> I've run several tests on a B180L, and only after downgrading to palo-1.3 I was able to boot again.
> 
> Am I the only one seeing this problem ? 

No - I've been seeing it on the c3600 as well.
I haven't tried 64-bit kernels.
And downgrading iplboot to 1.3 also solves it for me too.

palo 1.3 deb is available here in case someone has upgraded:
	http://iou.parisc-linux.org/~grundler/palo/palo_1.3_hppa.deb

thanks to paul bame for keeping those around.

> Anyone maybe has an idea what has been changed ?

nope...have to look at palo since it doesn't matter which
kernel I attempt to boot, it doesn't work.

Note that I tried to build palo v1.2 and that failed the same way.
So it's possibly a compiler issue with real-mode code.
(Not that the compiler knows the difference...)

grant
