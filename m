Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 276654894
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 08:50:33 -0600 (MDT)
Date: Sun, 28 Sep 2003 15:50:29 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6.0-test6-pa0 undefined references
In-Reply-To: <20030928144637.GG24824@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.58.0309281547200.29331@sal.ucc.ie>
References: <Pine.LNX.4.58.0309281530440.29331@sal.ucc.ie>
 <20030928144637.GG24824@parcelfarce.linux.theplanet.co.uk>
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

On Sun, 28 Sep 2003, Matthew Wilcox wrote:

> On Sun, Sep 28, 2003 at 03:44:14PM +0100, M. Grabert wrote:
> > I can't compine 2.6.0-test6-pa0, compiling stops with the following
> > error message:
>
> Yes, that's expected for -pa0.  It only gets -pa1 once these kinds of
> problems are fixed ;-)

Yes, that's why I didn't included my .config (since you just merged -test6
I assumed it's too early to blame it on my config ;)

I also just wanted to give you a hint what needs fixing *grin*

> > PS: I also can't compile smbfs in the kernel, but as module:
> >  (error about undefined reference to `low2highuid`)
>
> I'll look at that ...

Slan, Max
