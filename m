Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7905F4894
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 08:46:38 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3con-00071U-Gq; Sun, 28 Sep 2003 15:46:37 +0100
Date: Sun, 28 Sep 2003 15:46:37 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6.0-test6-pa0 undefined references
Message-ID: <20030928144637.GG24824@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0309281530440.29331@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0309281530440.29331@sal.ucc.ie>
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

On Sun, Sep 28, 2003 at 03:44:14PM +0100, M. Grabert wrote:
> I can't compine 2.6.0-test6-pa0, compiling stops with the following
> error message:

Yes, that's expected for -pa0.  It only gets -pa1 once these kinds of
problems are fixed ;-)

> PS: I also can't compile smbfs in the kernel, but as module:
>  (error about undefined reference to `low2highuid`)

I'll look at that ...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
