Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hadron.dyndns.org (ma-amesbury1e-100.mrrmnh.adelphia.net [68.168.107.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0B4C482E
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 14:25:35 -0700 (MST)
Date: Sun, 9 Feb 2003 16:24:54 -0500
From: "Aaron St. Pierre" <asp@ungod.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
Message-ID: <20030209212454.GB924@hadron>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <20030209031014.GD19683@dsl2.external.hp.com> <20030209122913.G27544@parcelfarce.linux.theplanet.co.uk> <20030209191441.GA21938@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209191441.GA21938@dsl2.external.hp.com>
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

In another life Grant Grundler wrote:

> On Sun, Feb 09, 2003 at 12:29:13PM +0000, Matthew Wilcox wrote:
> > I'll upload it to unofficial-debs and people will be able to apt-get
> > install it from there.
> 
> cool - thanks.
> 
> > Sure, but there's a measurable performance difference if you compile out
> > spinlocks
> 
> if people care about the last 5% performance, they still have several
> options:
> o build your own kernel

	As far as you know am I the only person, that has reported not being
	able to boot a 2.4.20-pa?? kernel compiled either natively or cross ? 

	By the way, I tried pa24 today, though I haven't built it natively
	yet I cross compiled it to no avail... 

> o run HPUX
> 
> I've not done or seen any lmbench perf results recently but before hpux
> was 10x faster on context switch/task related stuff.  And X11 server
> takes advantage of HW acceleration.
> (I'm associating UP systems with graphics which isn't always true)
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
Aaron St. Pierre			tel: 978.828.6177
asp@ungod.com

 Either I'm dead or my watch has stopped.
 		-- Groucho Marx's last words
