From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Fri, 19 Aug 2005 14:41:41 -0400 (EDT)
Message-ID: <200508191841.j7JIffAq013241@hiauly1.hia.nrc.ca>
References: <4305FA88.9040404@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4305FA88.9040404@tausq.org> from "Randolph Chung" at Aug 19,
	2005 11:28:08 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > TOC:
> > 
> > r2	__handle_mm_fault+0x68  (return from call to pte_alloc_map)
> > IIA	__handle_mm_fault+0x190
> > 
> > It looks as if this might have been caused by Process_3.exe in the
> > libjava GCC testsuite.
> 
> Does it always hang in the same place? How much RAM/swap do you have in 
> your system? Does it hang more/less if you disable swap?

I've seen this fault before.  I don't have enough data at this point
with 2.6.13 to say it always hangs in the same place.

RAM: 1GB

SWAP:
root@hiauly6:/home/dave# cat /proc/swaps
Filename                                Type            Size    Used    Priority
/dev/sdb1                               partition       265032  0       -1
/dev/sda1                               partition       263144  0       -2

dave@hiauly6:~$ ulimit -v
524288

The above limit was sufficient to prevent the as crash associated with
the 1GB .block directive.

I don't know the answer to the last question at this time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
