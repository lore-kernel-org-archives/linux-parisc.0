Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zayda.com (celery.zayda.com [208.186.180.200])
	by dsl2.external.hp.com (Postfix) with ESMTP id A90F0482B
	for <parisc-linux@parisc-linux.org>; Thu, 13 Dec 2001 00:22:31 -0700 (MST)
Received: from localhost (sonny@localhost)
	by zayda.com (8.11.6/8.11.6) with ESMTP id fBD7MPO28743
	for <parisc-linux@parisc-linux.org>; Thu, 13 Dec 2001 07:22:25 GMT
Date: Thu, 13 Dec 2001 07:22:25 +0000 (UTC)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] tulip driver 
In-Reply-To: <200112130036.RAA12216@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.33.0112130112510.18883-100000@zayda.com>
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

I'm still suspicious.  If I boot with init=/bin/sh, then it boots to the 
shell.  When I do an insmod on the tulip module, then the kernel crashes 
and spits out the (I think its the stack) debugging info.  At any rate, 
I'll give the latest kernel a try and see what happens.
Thanks,
Sonny

On Wed, 12 Dec 2001, Grant Grundler wrote:

> Sonny Cook wrote:
> > What is the state of the tulip driver currently?
> 
> Stable - I don't think tulip's your problem.
> 
> > The kernel I used is 2.4.16-pa16.  During 
> > the boot process, the kernel just locks up after reporting that it has 
> > freed some memory.
> 
> Helge enabled freeing bootmem and it was disabled again because of such
> lock-ups. At least until all extra __init's get removed.
> I think it's disabled since 2.4.16-pa18 or -pa19.
> So tulip is just a victim here and not a culprit.
> 
> > Any advice, or hint as to where to start looking would be appreciated.
> 
> Pull newer kernel source or disable the #if 1 that was enabled in -pa14.
> See parisc-linux-cvs archive for details.
> 
> grant
> 
