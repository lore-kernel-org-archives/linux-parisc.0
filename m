Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7034E482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 May 2002 15:50:30 -0600 (MDT)
Message-Id: <200205082150.g48LoH8F019074@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
To: phil@jaj.com (Phil Edwards)
Date: Wed, 8 May 2002 17:50:16 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, doko@cs.tu-berlin.de,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org
In-Reply-To: <20020506103212.A27151@disaster.basement.lan> from "Phil Edwards" at May 6, 2002 10:32:12 am
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

> > I still haven't figured out why libstdc++ needs to be installed prior
> > to running the testsuite.
> 
> That's weird... nothing immediately comes to mind.

LD_RUN_PATH in the environment is the culprit.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
