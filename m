Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08AA8482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 01:45:18 -0600 (MDT)
Date: Tue, 1 Jul 2003 09:45:12 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: Dub <dub@latnet.lv>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] modprobe: Can't locate module char-major-60 (server hangs!)
Message-ID: <20030701074512.GA29010@marmite.its.uct.ac.za>
References: <1056995678.3f00795e49bf5@clients.latnet.lv> <20030630175811.GK31618@parcelfarce.linux.theplanet.co.uk> <3F0095AA.4050909@latnet.lv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F0095AA.4050909@latnet.lv>
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

On Mon, Jun 30, 2003 at 10:55:22PM +0300, Dub wrote:
> 
> 
> Matthew Wilcox wrote:
> 
> >On Mon, Jun 30, 2003 at 08:54:38PM +0300, Dub wrote:
> > 
> >
> >>Jun 27 15:08:47 smsmail4 modprobe: modprobe: Can't locate module 
> >>char-major-60
> >>   
> >>
> >
> >ttyB0 has the wrong major number.  It needs to be character major 11.
> >
> > 
> >
> Thank you, great! If so, how to fix it in most efficient way?

Boot in single user mode, then:
# cd /dev
# rm ttyB0
# mknod ttyB0 c 11 0

-- 
Michael Wood <mwood@its.uct.ac.za>
