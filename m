From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: Runing small structs from functions.
Date: Thu, 10 Mar 2005 22:48:51 -0800
Message-ID: <20050311064850.GV4645@tausq.org>
References: <20050310170312.GM22872@baldric.uwo.ca>
	<200503101838.j2AIcgqI018769@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503101838.j2AIcgqI018769@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> This "should" work with 3.3 and later.  In previous versions, the
> justification was wrong and possibly 5-8 byte structs were not
> returned in ret0/ret1.  There is an incorrect code PR for a struct
> with three shorts.  I believe this problem is fixed in GCC 4.0 and
> later.  It would be safer if you explicitly pad the structs to 4
> or 8 bytes.  I can't remember if old versions of GCC return 5-8
> byte structs in ret0/ret1.  There was definitely a justification
> problem.

gcc-3.3 also returns <=8 bytes structs in ret0/ret1. there are lots of
gdb test cases to verify this.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
