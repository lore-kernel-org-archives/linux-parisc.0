Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D1904873
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Feb 2003 01:55:05 -0700 (MST)
Received: from esvir01nok.ntc.nokia.com (esvir01nokt.ntc.nokia.com [172.21.143.33])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h148rw205333
	for <parisc-linux@lists.parisc-linux.org>; Tue, 4 Feb 2003 10:53:58 +0200 (EET)
Date: Tue, 4 Feb 2003 10:55:02 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: ext Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Yet another tar-triggered problem?
Message-ID: <20030204085502.GQ7503@aurinko.ntc.nokia.com>
References: <20030203154450.GO7503@aurinko.ntc.nokia.com> <20030203173057.GC17807@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20030203173057.GC17807@dsl2.external.hp.com>
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

On Mon, Feb 03, 2003 at 10:30:57AM -0700, ext Grant Grundler wrote:
> On Mon, Feb 03, 2003 at 05:44:50PM +0200, Nahkola Mikko wrote:

> > ... the 70096's scrollback was full of something that looks like
> > a hex dump, and then a HPMC at the end.

> Likely a problem with st or scsi driver.
> Not many people are using tape drives so we don't get much
> feedback on that.

Well, duh ... tapes are fun. Wonder why no one seems interested in them 
nowadays.

> > Is anyone interested in the hex dump?

> Well, TBH, I'd be more interested in one from a 2.4.20 kernel.
> Too much code has changed since 2.4.18.

OK, I'll see if I can reproduce this on 2.4.20. 

It would be nice to get a newer kernel to work in real use too... funny 
that KDE should lock up though, that's not a symptom that I'd expect to 
see.

> > r00-03  00000000 10300010 1010d4e8 ffffffff
> ...
> > IASQ: 00000000 00000000 IAOQ: 1024a2d0 1024a2d4
> 
> Can you look up (IOAQ) 1024a2d0 and (GR02) 1010d4e8
> in the matching System.map?
> I'm curious where it died.

Well, 1010d4e8 seems to be in the middle of something...
1010d1c0 t pcxl_proc_info 	
1010d30c t .L1066
1010d36c T inb
............. lots of other "t .L???"s and an occasional "T inw"
1010d480 t .L708
1010d484 T inl
1010d4ec t .L712

1024a2d0 seems much more readable here... but then again the stuff is 
much further apart.

1024a2ac t dino_in32
1024a2e4 t dino_out8
1024a320 t dino_out16

> Though with HPMCs, it's likely to be a bug in some other code path.

Indeed, and on HP-UX I've seen occasional HPMCs with slightly-broken 
disks, for example... 


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
