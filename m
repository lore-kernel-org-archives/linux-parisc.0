Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5AA7E48AF
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 20:24:24 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 62614298047
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 20:24:23 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 17118-06 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 20:24:03 -0700 (MST)
Date: Sun, 22 Feb 2004 20:24:03 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: can't compile 2.4.24: pdc_cons.o problem!
Message-ID: <20040223032403.GB16784@colo.lackof.org>
References: <1077183184.403482d04a190@clients.latnet.lv>
	<20040222005241.GA30849@colo.lackof.org>
	<20040222012033.GN11824@parcelfarce.linux.theplanet.co.uk>
	<20040222065100.GG30849@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040222065100.GG30849@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 21, 2004 at 11:51:00PM -0700, Grant Grundler wrote:
> Failed to fetch http://cvs.parisc-linux.org/download/autobuild-kernels/./palinux-64-2.4.25-pa0_0-2_all.deb  404 Not Found
> E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
> 
> OIC... '64/' is missing. Ideas?

deb http://cvs.parisc-linux.org/download/autobuild-kernels/64/ ./

Thanks to Paul Bame for putting a similar line on
	htt://cvs.parisc-linux.org/download/linux-2.4/

thanks,
grant
