From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
Date: Wed, 8 May 2002 17:50:16 -0400 (EDT)
Message-ID: <200205082150.g48LoH8F019074__13045.105248648$1416621287$gmane$org@hiauly1.hia.nrc.ca>
References: <20020506103212.A27151@disaster.basement.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: tausq@debian.org, doko@cs.tu-berlin.de,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org
To: phil@jaj.com (Phil Edwards)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020506103212.A27151@disaster.basement.lan> from "Phil Edwards" at May 6, 2002 10:32:12 am
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
