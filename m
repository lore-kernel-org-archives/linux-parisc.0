Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 437EA4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 12:02:23 -0700 (MST)
Message-Id: <200211121902.gACJ22tw005444@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: jim_hull@hp.com
Date: Tue, 12 Nov 2002 14:02:01 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org
In-Reply-To: <012101c28a7b$6d84b7a0$6763f40f@cup.hp.com> from "Jim Hull" at Nov 12, 2002 10:43:43 am
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

> In other words, it must be a load or store of a destination register,
> either of the pending trapping instruction itself, or of any subsequent
> instruction which depends on that pending trapping instruction.

Ok.

Another issue that was somewhat vague was whether the state could be saved
without triggering pending traps.  Page 10-13 discusses special treatment
of a double word store of register 0 and states that it cancels all
pending traps.  On the otherhand, item 3 in the hit list and the instruction
description don't mention this treatment.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
