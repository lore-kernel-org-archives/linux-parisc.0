Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C4DF4844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 11:08:06 -0600 (MDT)
Message-Id: <200207101707.g6AH7xMS010810@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] SMP (in)stability
To: rhirst@linuxcare.com (Richard Hirst)
Date: Wed, 10 Jul 2002 13:07:59 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com, varenet@esiee.fr,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020710142317.GS6681@sleepie.demon.co.uk> from "Richard Hirst" at Jul 10, 2002 03:23:18 pm
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

> > -pa52 kernel panic'd at 22:07
> > running gcc1 test in background

In hacking gcc this morning trying to fix a bug in loading 64-bit
constants, I seem to have achieved a state where the gcc build crashes
gsyprf11 in a deterministic manner.  It's gone down three times.
It only takes a few seconds after the build starts for the machine
to crash.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
