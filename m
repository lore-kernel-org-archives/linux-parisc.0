Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B34294A1C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 05:40:32 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C7012B005; Wed,  7 Feb 2001 12:41:02 +0000 (GMT)
Date: Wed, 7 Feb 2001 12:41:02 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: Grant Grundler <grundler@cup.hp.com>,
	"M. Grabert" <xam@deathsdoor.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] //strace// Generic Parisc Linux Kernel Questions & 9000/730 success report
Message-ID: <20010207124102.C1374@linuxcare.com>
References: <Pine.LNX.4.21.0102061808500.2465-100000@sgate.charlysworld.de> <200102062022.MAA04003@milano.cup.hp.com> <20010206220733.Y1374@linuxcare.com> <3A81005D.393A0AA6@alcatel.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A81005D.393A0AA6@alcatel.at>; from christoph.plattner@alcatel.at on Wed, Feb 07, 2001 at 08:59:25AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 07, 2001 at 08:59:25AM +0100, Christoph Plattner wrote:
> I was definitly not able to build strace with the current tool chain
> (I have built myself from Jan 13, 2001). The system calls and other
> parts seem not to be compatible any more....

I've removed the hack that made it work with old glibc that didn't
provide a sys_ptrace wrapper, so it should now be ok with a newer
toolchain.  So, if you could try again and let me know...

Richard
