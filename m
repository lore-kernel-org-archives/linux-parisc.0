From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 13:36:51 -0700
Message-ID: <20040921203651.GU22642@tausq.org>
References: <20040921194939.GT22642@tausq.org>
	<200409212020.i8LKKQtS010621@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409212020.i8LKKQtS010621@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> As I suggested before, you can shorten (ldil/ldo/bv) to (ldil/be) if
> if you know which space register to use in the be (in user space, %sr4
> will always work since the address space is flat).

erm, yes, you did say that, and i forgot. i will change it.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
