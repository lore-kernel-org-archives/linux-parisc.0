Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 379D7482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 15:16:10 -0600 (MDT)
Message-Id: <200205302116.g4ULG2YZ003411@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Java and SSH
To: willy@debian.org (Matthew Wilcox)
Date: Thu, 30 May 2002 17:16:01 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com, marc@centraltx.com,
	parisc-linux@lists.parisc-linux.org, doko@cs.tu-berlin.de
In-Reply-To: <20020530221126.B10366@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at May 30, 2002 10:11:26 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > gcj builds without problem on all parisc configurations.  However,
> > nobody has done the work to port the java libraries.  I imagine
> > that getting the libraries to build under hppa-linux should be
> > pretty straight forward.
> 
> For some reason, doko disabled gcj from building in debian's packages.
> Anyone know why?

Probably, since gcj is more or less useless without the libraries.
The hard part may be libffi.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
