Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FED94868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 15:05:14 -0700 (MST)
Message-Id: <200312152205.hBFM5CEn018329@hiauly1.hia.nrc.ca>
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 15 Dec 2003 17:05:12 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <no.id> from "John David Anglin" at Dec 14, 2003 06:12:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] dlopen failed on 'libthread_db.so.1' -
	/lib/libthread_db.so.1: undefined symbol: ps_pglobal_lookup
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I hacked together of a build of debian gdb-6.0-2 this afternoon.  When
I start gdb, I see the following error:

dave@gsyprf11:~/gdb-6.0-2/objdir$ gdb/gdb


dlopen failed on 'libthread_db.so.1' - /lib/libthread_db.so.1: undefined symbol: ps_pglobal_lookup
GDB will not be able to debug pthreads.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
