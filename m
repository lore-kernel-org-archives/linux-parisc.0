Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3949B482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 09:02:01 -0600 (MDT)
Message-Id: <200210231501.g9NF1sYK022972@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22
To: jsoe0708@tiscali.be
Date: Wed, 23 Oct 2002 11:01:54 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: mszick@goquest.com, grundler@dsl2.external.hp.com,
	joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DB57761000002B9@ocpmta8.be.tiscali.com> from "jsoe0708@tiscali.be" at Oct 23, 2002 07:54:29 am
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

> >Ah, something I have been working on ...
> >
> Is it in already in gcc-3.2 or gcc-3.3 (snapshot which I would I have to
> toolchain?)?

Soon to be in 3.3.  I found a couple of more things yesterday in testing.
It needs a lot of testing (hppa1, hppa2, hppa64, hpux, linux, pic, short
and long calls).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
