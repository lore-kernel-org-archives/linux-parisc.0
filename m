Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43D69482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 14:03:00 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16EGWY-0001Fl-00; Wed, 12 Dec 2001 21:02:42 +0000
Date: Wed, 12 Dec 2001 21:02:42 +0000
From: Matthew Wilcox <willy@debian.org>
To: Tom <palinux@alaskatech.org>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	"James P. Kinney III" <jkinney@localnetsolutions.com>,
	palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Firmware upgraded, STI console problem
Message-ID: <20011212210242.E22198@parcelfarce.linux.theplanet.co.uk>
References: <200112122039.NAA11818@puffin.external.hp.com> <Pine.LNX.4.33.0112121147380.4162-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0112121147380.4162-100000@goliath.alaskatech.org>; from palinux@alaskatech.org on Wed, Dec 12, 2001 at 11:50:02AM -0900
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

On Wed, Dec 12, 2001 at 11:50:02AM -0900, Tom wrote:
> Okay - is there some short of note on which systems are 32-bit and which
> are 64-bit? Something like, "PA7000-series are 32-bit, PA-8000 (up to the
> 8x00) is 64-bit with 32-bit PDC and PA-8000 (after 8x00) is fully 64-bit".
> I just picked up a C180 and have a line on a C240 and was beginning to
> wonder the same things...

workstations: everything up to C360/J2240 has 32-bit firmware; B1000
and up have dual-32/64 bit firmware.
servers: N, L & A500 have 64-bit only firmware; A180 is 32-bit only.
don't know about other models.

-- 
Revolutions do not require corporate support.
