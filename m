Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC9C2482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 13:53:27 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GO90NH03.GTU for
          <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 11:52:29 -0900
Date: Wed, 12 Dec 2001 11:50:02 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: "James P. Kinney III" <jkinney@localnetsolutions.com>,
	palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Firmware upgraded, STI console problem 
In-Reply-To: <200112122039.NAA11818@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.33.0112121147380.4162-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> "James P. Kinney III" wrote:
> > Also, my processor is listed in firmware and docs as a PA8000. So why
> > not 64-bit cpu. If I boot the 2.4.16-64 kernel, it hangs after the
> > "branching" messege screen.=20
>
> You need to build your own 64-bit kernel with "NARROW_PDC" support enabled.
> But I totally agree with Matthew on this...don't bother.
> -
> grant

Okay - is there some short of note on which systems are 32-bit and which
are 64-bit? Something like, "PA7000-series are 32-bit, PA-8000 (up to the
8x00) is 64-bit with 32-bit PDC and PA-8000 (after 8x00) is fully 64-bit".
I just picked up a C180 and have a line on a C240 and was beginning to
wonder the same things...
