Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hp (IP-213157009128.dialin.heagmedianet.de [213.157.9.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D00C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 12:28:18 -0600 (MDT)
Date: Wed, 4 Sep 2002 20:28:14 +0200
From: Stefan Pfetzing <dreamind@dreamind.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFS - blkgetsize64
Message-ID: <20020904182814.GA17156@dreamind.de>
References: <20020904143013.GC4386@dreamind.de> <20020904165147.A33FC4829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020904165147.A33FC4829@dsl2.external.hp.com>
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

Hi,

* Grant Grundler <grundler@dsl2.external.hp.com> [020904 18:51]:
> Stefan Pfetzing wrote:
[snip]
> > P.S.: I'm using 2.4.19-pa9 with a self made diff from vanilla 2.4.19 against
> > XFS CVS. (the patch did in nearly cleanly)
> 
> Are you running 32-bit or 64-bit kernel?
> I want to know if arch/parisc/kernel/sys_parisc32.c might be the problem.
I'm running a 32bit kernel, since some time ago I had problems with 64bit and
cdrecord.

bye

Stefan

-- 
        http://www.dreamind.de/
Oroborus and Debian GNU/Linux Developer.
