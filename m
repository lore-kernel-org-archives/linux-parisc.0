Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B552483C
	for <parisc-linux@parisc-linux.org>; Wed, 13 Nov 2002 12:30:23 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18C3DO-0002OZ-00; Wed, 13 Nov 2002 19:30:18 +0000
Date: Wed, 13 Nov 2002 19:30:18 +0000
From: Matthew Wilcox <willy@debian.org>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] LONG pause on boot
Message-ID: <20021113193018.P30392@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0211131022210.26859-100000@wolf.alaskatech>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0211131022210.26859-100000@wolf.alaskatech>; from palinux@alaskatech.org on Wed, Nov 13, 2002 at 10:26:43AM -0900
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

On Wed, Nov 13, 2002 at 10:26:43AM -0900, Tom wrote:
> Does anyone have an idea as to why such a long delay would occur there?
> PDC has console to serial_1, which had a terminal on it. There was no
> errors or complaints anywhere in the boot process, and none visible during
> the kernel compile. I can provide System.map, config file, etc. if
> desired...

Yes, it's during device walk.  The support for E class that rbrad wrote
means that every machine with a CCIO suffers.  I suspect this'll get
fixed fairly soon.

-- 
Revolutions do not require corporate support.
