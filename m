Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8205E4A1C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 06:32:45 -0700 (MST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3A814CDE.2D3091A7@alcatel.at>
Date: Wed, 07 Feb 2001 14:25:50 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Grant Grundler <grundler@cup.hp.com>,
	"M. Grabert" <xam@deathsdoor.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] //strace// Generic Parisc Linux Kernel Questions &
 9000/730 success report
References: <Pine.LNX.4.21.0102061808500.2465-100000@sgate.charlysworld.de> <200102062022.MAA04003@milano.cup.hp.com> <20010206220733.Y1374@linuxcare.com> <3A81005D.393A0AA6@alcatel.at> <20010207124102.C1374@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello
	you mean, I can now check out the strace from CVS ?
And retry ??

Thanks
	Christoph

Richard Hirst wrote:
> 
> On Wed, Feb 07, 2001 at 08:59:25AM +0100, Christoph Plattner wrote:
> > I was definitly not able to build strace with the current tool chain
> > (I have built myself from Jan 13, 2001). The system calls and other
> > parts seem not to be compatible any more....
> 
> I've removed the hack that made it work with old glibc that didn't
> provide a sys_ptrace wrapper, so it should now be ok with a newer
> toolchain.  So, if you could try again and let me know...
> 
> Richard

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
