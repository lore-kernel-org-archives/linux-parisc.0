Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 059F8482B
	for <parisc-linux@parisc-linux.org>; Thu, 13 Dec 2001 00:47:33 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16EQaU-0001Zi-00; Thu, 13 Dec 2001 07:47:26 +0000
Date: Thu, 13 Dec 2001 07:47:26 +0000
From: Matthew Wilcox <willy@debian.org>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] tulip driver
Message-ID: <20011213074726.F8225@parcelfarce.linux.theplanet.co.uk>
References: <200112130036.RAA12216@puffin.external.hp.com> <Pine.LNX.4.33.0112130112510.18883-100000@zayda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0112130112510.18883-100000@zayda.com>; from sonny@aspersion.org on Thu, Dec 13, 2001 at 07:22:25AM +0000
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

On Thu, Dec 13, 2001 at 07:22:25AM +0000, Sonny Cook wrote:
> I'm still suspicious.  If I boot with init=/bin/sh, then it boots to the 
> shell.  When I do an insmod on the tulip module, then the kernel crashes 
> and spits out the (I think its the stack) debugging info.  At any rate, 
> I'll give the latest kernel a try and see what happens.

tulip isn't the problem.  tulip is calling some routine which is the
problem.  we just don't know which one.

-- 
Revolutions do not require corporate support.
