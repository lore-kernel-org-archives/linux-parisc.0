Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35C894834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Jan 2002 23:59:19 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16U0K6-0005sE-00; Fri, 25 Jan 2002 06:58:54 +0000
Date: Fri, 25 Jan 2002 06:58:54 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] start physical address for 712/100
Message-ID: <20020125065854.E30669@parcelfarce.linux.theplanet.co.uk>
References: <3C4E842F.3D36290F@admin.france.hp.com> <bruno_vidal@hpfrcu03.france.hp.com> <20020125062205.0BFAF482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020125062205.0BFAF482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Jan 24, 2002 at 11:22:05PM -0700
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

On Thu, Jan 24, 2002 at 11:22:05PM -0700, Grant Grundler wrote:
> Bruno Vidal wrote:
> > 	Hi
> > I start to look a bit more deeply in the dump
> > I'm creating. And I found that the physical
> > memory start at address 0x0000000010000000.
> > Is it normal ? Or do I missed something ?
> 
> Uhm...I don't think thats right. All parisc boxes have
> physical memory that's zero based. You should be able
> to verify this with any HPUX crash dump.
> 
> Post where you are getting the data from and perhaps
> we can help correct it.

We start mapping physical ram at address 0x0000000010000000.  So physical
address 0 is mapped at virtual address 0x0000000010000000 when in
the kernel.

-- 
Revolutions do not require corporate support.
