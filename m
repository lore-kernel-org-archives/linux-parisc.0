Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25F924848
	for <parisc-linux@parisc-linux.org>; Tue, 12 Feb 2002 14:35:47 -0700 (MST)
Date: Tue, 12 Feb 2002 15:35:33 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] lp0 kablooie (new kernel)
In-Reply-To: <20020212223104.A14146@solo.franken.de>
Message-ID: <Pine.LNX.4.21.0202121534350.30091-100000@maestro.symsys.com>
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

On Tue, 12 Feb 2002, Thomas Bogendoerfer wrote:

> On Tue, Feb 12, 2002 at 10:55:41AM -0600, Greg Ingram wrote:
> > On Sat, 9 Feb 2002, Grant Grundler wrote:
> > > Greg Ingram wrote:
> > > > 
> > > > Writing data from my C100 to /dev/lp0 makes the kernel go kablooie.  It's
> > > > the kernel from the recent (0.9.3?) iso.  Known problem?  Any more info I
> > > > could supply that would help?  I've appended everything on the console
> > > > from the crash, through the power cycle, to mounting disks again.  
> > > 
> > > Can you grab a newer kernel from ftp://ftp.parisc-linux.org/kernels/32/
> > > and try that?
> > > 
> > > 0.9.3 is just not worth chasing at this point.
> > 
> > Yikes!
> > 
> > apollos:~# uname -a
> > Linux apollos 2.4.17-pa23 #1 Sun Feb 10 09:24:11 MST 2002 parisc unknown
> > apollos:~# echo >/dev/lp0
> > lp0: compatibility mode
> 
> I've reproduced it on my B132. You could avoid the crash by disabling
> CONFIG_PARPORT_PC. No idea how good parport works, but my B132 doesn't crash
> anymore.

Hmm...  Can you print?

- Greg
