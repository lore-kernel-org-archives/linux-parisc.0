Return-Path: <mort@galileo.bork.org>
Received: from galileo.bork.org (galileo.bork.org [66.11.174.156])
	by dsl2.external.hp.com (Postfix) with SMTP id D18A448DD
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 29 Apr 2004 07:24:38 -0600 (MDT)
Date: Thu, 29 Apr 2004 09:24:38 -0400
From: Martin Hicks <mort@bork.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] A job for a debian-developer?
Message-ID: <20040429132438.GB16062@localhost>
References: <20040428180741.GH6936@baldric.uwo.ca>
	<20040428225420.GB21045@localhost>
	<20040428231610.GK6936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040428231610.GK6936@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



On Wed, Apr 28, 2004 at 07:16:10PM -0400, Carlos O'Donell wrote:
> On Wed, Apr 28, 2004 at 06:54:20PM -0400, Martin Hicks wrote:
> > On Wed, Apr 28, 2004 at 02:07:41PM -0400, Carlos O'Donell wrote:
> > > 
> > > parisc-linux,
> > > 
> > > Do we know if any programs use K_INLINE_SYSCALL from our
> > > linux/include/asm-parisc/unistd.h, or rather all the _syscall[n] macros?
> > > 
> > > It's rather wrong. Even if I were to correct the issue, I'm curious if
> > > anything uses these definitions. 
> > 
> > klibc uses the _syscall[n] stuff.
> 
> I don't even know if we have a klibc port? :)
> I'll check both out. Thanks Martin.

I did the initial work, and kyle fixed it up and sent the patch to hpa.
That was probably three weeks ago.

mh

-- 
Martin Hicks || mort@bork.org || PGP/GnuPG: 0x4C7F2BEE
