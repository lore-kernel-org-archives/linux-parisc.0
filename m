Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 130124829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 22:04:09 -0600 (MDT)
Message-Id: <200209210338.g8L3ccnN005029@hiauly1.hia.nrc.ca>
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Fri, 20 Sep 2002 23:38:37 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020920203724.GD24622@systemhalted> from "Carlos O'Donell" at Sep 20, 2002 04:37:24 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] malloc limits
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

In looking at the failure of the gcc v3 pthread2 test, I see it dies
with a segv in chunk_free when next is larger than 0x80000000:

#0  chunk_free (ar_ptr=0x400ad16c, p=0x4010c744) at malloc.c:3179
3179      nextsz = chunksize(next);
(gdb) p next
$2 = (struct malloc_chunk *) 0x802191cc

I thought there was a flat memory model.  If so, shouldn't it be possible
for the data section to expand past 0x80000000?

The test will pass if I cut max_loop_count to 30000.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
