Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nuada.toptech.com.ar (nuada.toptech.com.ar [200.68.70.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0566E482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 14:14:27 -0600 (MDT)
Received: from zacarias.com.ar (imhotep.toptech.com.ar [200.68.70.115])
	(authenticated)
	by nuada.toptech.com.ar (8.11.6/8.11.6) with ESMTP id h78KELL17180
	for <parisc-linux@lists.parisc-linux.org>; Fri, 8 Aug 2003 17:14:21 -0300
Message-ID: <3F340476.2010708@zacarias.com.ar>
Date: Fri, 08 Aug 2003 17:13:42 -0300
From: Gustavo Zacarias <gustavo@zacarias.com.ar>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] K360 with 64 bit kernel?
References: <BB59778F.104%rtodd@antipentium.com>
In-Reply-To: <BB59778F.104%rtodd@antipentium.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Richard Todd wrote:

> Gentoo is running fine in 64 bit on a few test boxes we have.
> Irc.us.freenode.net #gentoo-hppa Gmsoft is the best source of help

I'm running gentoo and talking with Gmsoft on irc also :)
Basically he has no clue on this, they didn't test much on K models.
And i forgot to mention that the debian netinst testing ISOs (PDC 
console of course) from parisc-linux.org also fail this way.
Mostly sounds like the zalon driver isn't 64 bit clean since the kernel 
just gets stuck without any kind of oops or anything.
