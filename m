Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73079482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 10:42:42 -0700 (MST)
Message-Id: <200211181742.gAIHgWcv019940@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 18 Nov 2002 12:42:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
In-Reply-To: <20021118161215.GE2729@systemhalted> from "Carlos O'Donell" at Nov 18, 2002 11:12:15 am
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

> - Implement atomic_add, echange_and_add, and compare and swap, which are
>   required in atomicity.h

I added an implementation of atomic_add and echange_and_add to libstdc++
recently.  You can probably copy most of it for glibc, although the libstdc++
implementation is for c++.  The main problem would be in initializing
the 16 byte lock structure.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
