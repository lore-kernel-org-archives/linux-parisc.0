Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1 (unknown [217.116.164.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id B22E14829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 05:29:46 -0600 (MDT)
Date: Tue, 24 Sep 2002 14:28:30 +0300
From: Arto Jantunen <viiru@debian.org>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems
Message-ID: <20020924112830.GA27877@dt-link.fi>
References: <20020924060541.GA27852@dt-link.fi> <Pine.LNX.4.44.0209240141510.20374-100000@garibaldi.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0209240141510.20374-100000@garibaldi.apptechsys.com>
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

On Tue, Sep 24, 2002 at 01:48:31AM -0700, Jeremy Drake wrote:
> On Tue, 24 Sep 2002, Arto Jantunen wrote:
> 
> > Any news on the SMP trouble on PA-8200 and similar? Someone said that he
> > would be working on it last week. I heard some stuff about it working on
> > 64-bit kernels, but 64-bit crashes immediately on my box, SMP or no SMP.
> > I would really like to get this monster doing some real work, so any
> > news is good news.
> I don't know exactly what hardware you have, but my J5k is chugging 
> happily along running 2.4.19-64-smp from sid, and the only problem I have 
> encountered as of yet is a lockup when starting setserial on boot.  Other 
> than that, it seems to be as stable as uniproc 32-bit.  Whatever hardware 
> you have, I'm willing to bet that it isn't a J5k, and any differences 
> involved may complicate things, so (as always) YMMV.

I have a HP9000/D390. Dual PA-8200. It doesn't boot at all with that
kernel or any other 64-bit kernel. Some things do suggest that it should
work, but it doesn't. After the kernel branching point it starts
scrolling FLT codes on the LCD display, but doesn't report anything on
the console. I have a ser pim output taken out after rebooting the box
if someone is interrested. I'll try building the latest CVS with 32-bit
and SMP and see if it's any better then the ones I have tried so far.

--
Arto Jantunen
