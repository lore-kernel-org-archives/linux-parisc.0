Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0895F4843
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 15:01:49 -0600 (MDT)
Message-Id: <200205302101.g4UL1k8l003364@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Java and SSH
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Thu, 30 May 2002 17:01:45 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: marc@centraltx.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020530205206.748C7482B@dsl2.external.hp.com> from "Grant Grundler" at May 30, 2002 02:52:06 pm
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

> > I have network connectivity now, and heres what I get for the
> > java possibilities:
> 
> Phil Pinkerton had complained about this earlier.
> He couldn't even get the code from Sun to compile.

gcj builds without problem on all parisc configurations.  However,
nobody has done the work to port the java libraries.  I imagine
that getting the libraries to build under hppa-linux should be
pretty straight forward.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
