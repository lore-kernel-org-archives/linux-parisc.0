Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p50844C46.dip.t-dialin.net [80.132.76.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93C88482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Mar 2002 16:00:18 -0700 (MST)
Date: Thu, 28 Mar 2002 23:59:06 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Tilo Jandt <tilo@jandt-online.net>
Cc: Christian Suder <csuder@cisco.com>,
	David Dougall <davidd@et.byu.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mozilla, etc.
Message-ID: <20020328235906.A11055@solo.franken.de>
References: <3CA2ADDB.4EE8AFA4@cisco.com> <Pine.LNX.4.33.0203272123310.1463-100000@lewis.et.byu.edu> <3CA2ADDB.4EE8AFA4@cisco.com> <20020328093151.GA20881@elvis.franken.de> <5.1.0.14.2.20020328171235.02e71248@pop.puretec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.2.20020328171235.02e71248@pop.puretec.de>; from tilo@jandt-online.net on Thu, Mar 28, 2002 at 05:13:56PM +0100
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

On Thu, Mar 28, 2002 at 05:13:56PM +0100, Tilo Jandt wrote:
> 
> 
> >to get it running, you need to recompile it with -O optimizing level.
> 
> how do you recompile it?

apt-get source mozilla
cd mozilla-0.9.9
vi debian/rules
dpkg-buildpackage -b
/* wait some hours */

> >But there is galeon, which uses mozillas rendering engine, which (also
> >compiled with -O) gives me a working web browser.
> 
> since the upgrade to mozilla 0.9.9 i can't use galeon any more.

I've placed the .debs, which I'm using to:

http://gsyprf11.external.hp.com/~tsbogend

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
