From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: a fix for NS87415 on C3K broken
Date: Thu, 23 Sep 2004 09:27:50 -0700
Message-ID: <20040923162750.GX22642__26756.0363784016$1416624480$gmane$org@tausq.org>
References: <41501936000007AF@mail-7-bnl.tiscali.it>
	<4152E6450000004C@mail-3-bnl.tiscali.it>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>,
 parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4152E6450000004C@mail-3-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> But when I try to use the ide-cdrom the system carsh with such oops:
> Backtrace:
>  [<000000001017e0d8>] drain_array_locked+0x98/0x148
>  [<000000001017e2c4>] cache_reap+0x13c/0x2b0
>  [<000000001015e574>] worker_thread+0x284/0x330
>  [<0000000010164714>] kthread+0x12c/0x138
>  [<000000001010647c>] ret_from_kernel_thread+0x24/0x38

maybe this will help:
http://marc.theaimsgroup.com/?l=linux-kernel&m=109529103522064&w=2

but we are seeing some of these slab errors with this build that are not
cdrom related too... :(

can you try compiling with slab debug (under kernel debugging)?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
