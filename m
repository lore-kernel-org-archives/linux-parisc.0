Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 256E2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 08:02:06 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] modprobe: Can't locate module char-major-60 (server hangs!)
Message-ID: <1057068124.3f01945c8f4be@clients.latnet.lv>
Date: Tue, 01 Jul 2003 17:02:04 +0300 (EEST)
From: Dub <dub@latnet.lv>
References: <1056995678.3f00795e49bf5@clients.latnet.lv> <20030630175811.GK31618@parcelfarce.linux.theplanet.co.uk> <3F0095AA.4050909@latnet.lv> <20030701074512.GA29010@marmite.its.uct.ac.za>
In-Reply-To: <20030701074512.GA29010@marmite.its.uct.ac.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
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

> > >ttyB0 has the wrong major number.  It needs to be character major
> 11.
> > >
> > > 
> > >
> > Thank you, great! If so, how to fix it in most efficient way?
> 
> Boot in single user mode, then:
> # cd /dev
> # rm ttyB0
> # mknod ttyB0 c 11 0
>
> Michael Wood <mwood@its.uct.ac.za>

Thanks a lot, Michael! It works!!!

BR,
Dub 
