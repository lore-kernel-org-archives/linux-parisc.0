Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B0C54829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Feb 2003 03:11:14 -0700 (MST)
Received: from esvir05nok.ntc.nokia.com (esvir05nokt.ntc.nokia.com [172.21.143.37])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h16AA7211326
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Feb 2003 12:10:07 +0200 (EET)
Date: Thu, 6 Feb 2003 12:11:10 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: ext Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Yet another tar-triggered problem?
Message-ID: <20030206101110.GV7503@aurinko.ntc.nokia.com>
References: <20030203154450.GO7503@aurinko.ntc.nokia.com> <20030203173057.GC17807@dsl2.external.hp.com> <20030204085502.GQ7503@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20030204085502.GQ7503@aurinko.ntc.nokia.com>
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

On Tue, Feb 04, 2003 at 10:55:02AM +0200, ext Nahkola Mikko wrote:
> On Mon, Feb 03, 2003 at 10:30:57AM -0700, ext Grant Grundler wrote:

> > > Is anyone interested in the hex dump?
> > Well, TBH, I'd be more interested in one from a 2.4.20 kernel.
> > Too much code has changed since 2.4.18.

> OK, I'll see if I can reproduce this on 2.4.20. 
> It would be nice to get a newer kernel to work in real use too... funny 
> that KDE should lock up though, that's not a symptom that I'd expect to 
> see.

Oh well. 2.4.20-pa23 looks quite good actually - no panic/HPMC yet, no 
matter what I do with the tape drive (but it still doesn't _work_ ... 
"/dev/st0: Input/output error" every time) and KDE works too. 

I'll see if it does that with another drive too.


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
