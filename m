Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 149E24840
	for <parisc-linux@parisc-linux.org>; Sun, 23 Nov 2003 14:45:56 -0700 (MST)
Message-Id: <200311232145.hANLjo4i028914@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Tool chain pb
To: jbglaw@lug-owl.de (Jan-Benedict Glaw)
Date: Sun, 23 Nov 2003 16:45:50 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20031123213657.GT1037@lug-owl.de> from "Jan-Benedict Glaw" at Nov 23, 2003 10:36:58 pm
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

> > This is complicated, and requires an in-depth understanding of GCC
> > and binutils.
> 
> I thrust you - bad for me; I'm currently looking at vax-linux, where we
> use an quite dated compiler...

There is one outstanding PR for the vax which causes labels to be deleted
after a case insn.  If this gets fixed, you probably should be able to
switch to GCC 3.4.  I know C builds at -O1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
