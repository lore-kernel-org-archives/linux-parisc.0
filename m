Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-3.cisco.com (sj-msg-core-3.cisco.com [171.70.157.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id B265D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 16:58:29 -0700 (MST)
Message-Id: <4.3.2.7.2.20020104154342.02a49428@mira-sjc5-9.cisco.com>
Date: Fri, 04 Jan 2002 15:58:06 -0800
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From: Christian Suder <csuder@cisco.com>
Subject: Re: [parisc-linux] Need five #defines, please.....
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020104233146.A31733@solo.franken.de>
References: <20020104012559.69375281.csuder@cisco.com>
 <20020104012559.69375281.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 11:31 PM 1/4/2002 +0100, Thomas Bogendoerfer wrote:
>On Fri, Jan 04, 2002 at 01:25:59AM -0800, Christian Suder wrote:
> > I'm trying to skin the lizard (mozilla 0.9.7). I can build with the linux
> > default pthreads, but it doesn' work, windows show up but the content is
> > not drawn etc.. Hence I'd like to try a build with "classic" NSPR, which
> > implements it's own threading mechanism. Problem : There is a couple of
> > hardware-specific definitions that I don't know how to do, but somebody
>
>I don't thing anyone has ported libc5 to hppa. Those missing defines are
>libc5 hooks, iirc.

If I'm not mistaken libc5 <=> glibc1 and libc6 <=> glibc2, these are the 
ones for glibc2. In any case it runs on a (Linux-)Sparc with glibc2.


>Fixing pthreads would be much more productive.

Agree. However I believe the problems to be caused by sloppy programming in 
terms of thread handling, at least that was the issue I had with the pan 
newsreader (which behaved similar, btw). I don't think that can be fixed in 
the NSPR abstraction layer if it is caused by the application not calling 
the appropriate functions when needed. And I'm not going to dig through 160 
MB of source to find where somebody didn't initialize something 
correctly.... I'm going back and forth though to see if it is something hat 
can be done in NSPR.

Especially when in the end I don't want to run mozilla anyways. I just want 
the rendering engine to work so some more lightweight client like galeon 
can be used.

         Christian 
