From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Sun, 30 Apr 2006 19:30:03 -0400 (EDT)
Message-ID: <200604302330.k3UNU3C5017984@hiauly1.hia.nrc.ca>
References: <200604301801.23210.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604301801.23210.mszick@morethan.org> from "Michael S. Zick"
	at Apr 30, 2006 06:01:23 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Somewhere it is written: "No data should be stored on the same cache
> line as the lock unless all access is protected by that lock."

It's in the arch:

  When using semaphores to synchronize with I/O, care must be taken
  in placing other information in the same cache line as the semaphore.
  Data which is writable, can only be placed in the same cache line as
  a semaphore if access to write the data is controlled by the semaphore.

I think it's easy to misread these two sentences (i.e., to assume
that writeable data can occur on the same line as the semaphore
if the semaphore isn't being used to synchonize with I/O).

I'm almost certain we have more than one semaphore per line in current
kernels and I think that using ldcw,co is dangerous when that's done.
ldcw appears safer because it does a flush if needed.  Still, I worry
that this may not be sufficient because a sync is usually also necessary.
Flushes are weakly ordered.

If we dedicate 128 bytes per semaphore, then possibly ldcw,co will work.
It's also optimal from the contention standpoint.  This is pointed out
in the paper on semaphores.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
