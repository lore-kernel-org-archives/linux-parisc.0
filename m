Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA46B4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:07:04 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2045AB005; Tue,  6 Feb 2001 22:07:34 +0000 (GMT)
Date: Tue, 6 Feb 2001 22:07:33 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: "M. Grabert" <xam@deathsdoor.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Generic Parisc Linux Kernel Questions & 9000/730 success report
Message-ID: <20010206220733.Y1374@linuxcare.com>
References: <Pine.LNX.4.21.0102061808500.2465-100000@sgate.charlysworld.de> <200102062022.MAA04003@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102062022.MAA04003@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Feb 06, 2001 at 12:22:03PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 06, 2001 at 12:22:03PM -0800, Grant Grundler wrote:
> Don't know about strace.

If you check it out of our cvs and build it, it should basically
work under 32 bit kernels.  I still need to tidy up before I can
integrate though.

Richard
