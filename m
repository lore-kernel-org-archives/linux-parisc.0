Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-5-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B703482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 12:07:41 -0600 (MDT)
Date: Wed, 29 May 2002 19:07:39 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Cc: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020529180739.GL9919@tykepenguin.com>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com> <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020529132631.B3691@systemhalted>
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

On Wed, May 29, 2002 at 01:26:31PM -0400, Carlos O'Donell Jr. wrote:
> > 
> > Oh, I'm doing that. I just tried it again, it was either that or throw it out
> > of the window.
> > 
> > Is there parisc version of the kdb patch I could try applying to a kernel
> > source I know works maybe ?
> >
> 
> We are trying not to maintian patches but rather a branch of the
> kernel representing common-2 + parisc specific kdb changes.

I can understand the logic of that and if it worked for me I would regard it as
the best solution to the problem if maintaing two sets of patches.
 
> Look at this if you want to see the patch method:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-May/016246.html

Thanks, I'll try that on my Debian kernel and see what happens. Despite my
frustrations I really do want to get kdb working on this box. I like my HP box a
lot and I've got some kernel code that really does need fixing for that
platform.

+ we have a long weekend off coming up here in Britain and it's the perfect
diversion for that essay I really have to write ... :-)
 
patrick
