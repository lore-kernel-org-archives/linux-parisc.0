Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA8EE482A
	for <parisc-linux@parisc-linux.org>; Thu, 13 Dec 2001 22:06:05 -0700 (MST)
Message-Id: <200112140500.WAA21568@puffin.external.hp.com>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] anon cvs 
In-Reply-To: Message from Sonny Cook <sonny@aspersion.org>
   of "Thu, 13 Dec 2001 20:59:45 GMT." <Pine.LNX.4.33.0112132057310.18883-100000@zayda.com>
Date: Thu, 13 Dec 2001 22:00:35 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Sonny Cook wrote:
> Is something up with anonamous cvs access?  I get the following error when 
> attempting to update my kernel tree:
> 
> angstrom:/usr/src/linux-2.4.16-pa16# cvs update -dP .
> cvs [update aborted]: recv() from server cvs.parisc-linux.org: Connection 
> reset by peer

I got (nearly) the same error but realized I was using puffin.external.hp.com
server which is wrong. You have the right server.
I fixed the Root files in my local tree and all was well.

> I also noticed that the nightly snapshots are about 45 bytes long.

That was a bug in the scripts. Paul Bame fixed that yesterday.
2.4.16-pa19 should be ok - at least it was last night.

hth,
grant
