Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0F9B4848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 15:11:27 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17DXCg-0006YM-00; Thu, 30 May 2002 22:11:26 +0100
Date: Thu, 30 May 2002 22:11:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	marc@centraltx.com, parisc-linux@lists.parisc-linux.org,
	Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] Java and SSH
Message-ID: <20020530221126.B10366@parcelfarce.linux.theplanet.co.uk>
References: <20020530205206.748C7482B@dsl2.external.hp.com> <200205302101.g4UL1k8l003364@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200205302101.g4UL1k8l003364@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Thu, May 30, 2002 at 05:01:45PM -0400
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

On Thu, May 30, 2002 at 05:01:45PM -0400, John David Anglin wrote:
> > > I have network connectivity now, and heres what I get for the
> > > java possibilities:
> > 
> > Phil Pinkerton had complained about this earlier.
> > He couldn't even get the code from Sun to compile.
> 
> gcj builds without problem on all parisc configurations.  However,
> nobody has done the work to port the java libraries.  I imagine
> that getting the libraries to build under hppa-linux should be
> pretty straight forward.

For some reason, doko disabled gcj from building in debian's packages.
Anyone know why?

-- 
Revolutions do not require corporate support.
