Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-4.cisco.com (sj-msg-core-4.cisco.com [171.71.163.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D13A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 29 Mar 2002 11:47:29 -0700 (MST)
Message-Id: <4.3.2.7.2.20020329103302.0252c9c8@mira-sjc5-9.cisco.com>
Date: Fri, 29 Mar 2002 10:45:39 -0800
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From: Christian Suder <csuder@cisco.com>
Subject: Re: [parisc-linux] Mozilla, etc.
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020328235906.A11055@solo.franken.de>
References: <5.1.0.14.2.20020328171235.02e71248@pop.puretec.de>
 <3CA2ADDB.4EE8AFA4@cisco.com>
 <Pine.LNX.4.33.0203272123310.1463-100000@lewis.et.byu.edu>
 <3CA2ADDB.4EE8AFA4@cisco.com>
 <20020328093151.GA20881@elvis.franken.de>
 <5.1.0.14.2.20020328171235.02e71248@pop.puretec.de>
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

Thanks Thomas,

that helped quite a bit. I used an older mozilla tree which I had and 
compiled it with -O and it worked with skipstone. I'm now using your 
binaries (saved a couple of hours...;-) with a recent skipstone and it 
works pretty well on a local X display.

It has some issues running remotely (window not always redrawn, hangs 
sometimes). Galeon doesn't want to run at all on a remote display, a couple 
of tasks are spawning but nothing on the screen. This seems to be a generic 
issue with appearantly mostly GTK+ applications. Pan and sylpheed are two 
other apps that don't want to run remotely although they do work on a local 
display.

         Christian


At 11:59 PM 3/28/2002 +0100, Thomas Bogendoerfer wrote:
>On Thu, Mar 28, 2002 at 05:13:56PM +0100, Tilo Jandt wrote:
> >
> >
> > >to get it running, you need to recompile it with -O optimizing level.
> >
> > how do you recompile it?
>
>apt-get source mozilla
>cd mozilla-0.9.9
>vi debian/rules
>dpkg-buildpackage -b
>/* wait some hours */
>
> > >But there is galeon, which uses mozillas rendering engine, which (also
> > >compiled with -O) gives me a working web browser.
> >
> > since the upgrade to mozilla 0.9.9 i can't use galeon any more.
>
>I've placed the .debs, which I'm using to:
>
>http://gsyprf11.external.hp.com/~tsbogend
>
>Thomas.
>
>--
>Crap can work. Given enough thrust pigs will fly, but it's not necessary a
>good idea.                                 [ Alexander Viro on linux-kernel ]
