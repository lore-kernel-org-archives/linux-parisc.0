Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75B55482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Apr 2002 08:46:41 -0700 (MST)
Message-Id: <200204041546.g34FkZwt010003@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] "unaligned access to ... at ip=..." problem with evms and jfs
To: joel.soete@freebel.net
Date: Thu, 4 Apr 2002 10:46:35 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <1017913566.3cac20de230de@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Apr 4, 2002 11:46:06 am
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

> Quoting Randolph Chung <randolph@tausq.org>:
> 
> > > It seems harmless but not sure.
> > 
> > well.... in general this is not a problem, however....
> > 
> > Fleedwood found a bug in the unaligned handler last week. it doesn't
> > handle the pre/post increment cases of load and store, and there may be
> > some cases where these messages will indicate the cause of errors.
> > 
> > I'll look into fixing this, but it might take some time.
> > 
> 
> Well I will be patient as till now (at least a month) evms seems to works
> correctly :-)

We used to have a huge number of page faults filling log files on gsyprf11.
This was mysteriously fixed a few weeks ago.  Anybody know what fixed the
problem?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
