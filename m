Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p50845BA8.dip.t-dialin.net [80.132.91.168])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47C7D4844
	for <parisc-linux@parisc-linux.org>; Tue, 12 Feb 2002 14:32:02 -0700 (MST)
Date: Tue, 12 Feb 2002 22:31:04 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] lp0 kablooie (new kernel)
Message-ID: <20020212223104.A14146@solo.franken.de>
References: <Pine.LNX.4.21.0202121054260.27781-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0202121054260.27781-100000@maestro.symsys.com>; from ingram@symsys.com on Tue, Feb 12, 2002 at 10:55:41AM -0600
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

On Tue, Feb 12, 2002 at 10:55:41AM -0600, Greg Ingram wrote:
> On Sat, 9 Feb 2002, Grant Grundler wrote:
> > Greg Ingram wrote:
> > > 
> > > Writing data from my C100 to /dev/lp0 makes the kernel go kablooie.  It's
> > > the kernel from the recent (0.9.3?) iso.  Known problem?  Any more info I
> > > could supply that would help?  I've appended everything on the console
> > > from the crash, through the power cycle, to mounting disks again.  
> > 
> > Can you grab a newer kernel from ftp://ftp.parisc-linux.org/kernels/32/
> > and try that?
> > 
> > 0.9.3 is just not worth chasing at this point.
> 
> Yikes!
> 
> apollos:~# uname -a
> Linux apollos 2.4.17-pa23 #1 Sun Feb 10 09:24:11 MST 2002 parisc unknown
> apollos:~# echo >/dev/lp0
> lp0: compatibility mode

I've reproduced it on my B132. You could avoid the crash by disabling
CONFIG_PARPORT_PC. No idea how good parport works, but my B132 doesn't crash
anymore.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
