From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Improving performance of munmap
Date: Thu, 7 Oct 2004 21:16:57 -0700
Message-ID: <20041008041657.GG14151@tausq.org>
References: <20041007230232.GF14151@tausq.org>
	<20041008020343.GN24430@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041008020343.GN24430@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Is munmap() speed really a big issue? Does userland see the benefits of
> a faster flush_tlb_mm()?

actually i was wrong, the problem is not with flush_tlb_mm(), but with
flush_user_{dcache,icache}_range.

> Perhaps if you call dlclose() *a lot* you might notice.
> 
> Or if you create and destroy threads really quickly.
> 
> Aside from that, who else in userspace is a big munmap caller?

lots of apps use mmap a lot..... but even if they don't, 0.9 seconds is
a very long time to make somebody wait.

i made some changes to the flush_user_{dcache,icache}_range
implementation and it seems to be better now. will post the patch
tomorrow after some cleanups.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
