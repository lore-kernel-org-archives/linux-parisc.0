Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9FD24842
	for <parisc-linux@parisc-linux.org>; Fri, 28 Feb 2003 11:11:44 -0700 (MST)
Message-Id: <200302281811.h1SIBeBk003472@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: jsoe0708@tiscali.be (Joel Soete)
Date: Fri, 28 Feb 2003 13:11:39 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <3E5F80120000003F@ocpmta8.freegates.net> from "Joel Soete" at Feb 28, 2003 06:19:02 pm
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

> >I test it on gcc-3.2 64bits and I obtain a a kernel (I will try to boot
> it
> >latter).

I would like to strongly suggest 3.3 be used for this kind testing.
The 3.2 branch is more or less at its end.  There is a serious PR
relating to building a cross to hppa64-linux on hppa-linux which
hasn't been resolved.  3.3 has a huge number of changes (hopefully
improvements) for hppa64 and we are still doing bug fixes (no new
features).  3.3 isn't far from release, so the more testing the
better.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
