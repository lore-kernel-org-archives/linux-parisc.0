From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] Re: atlas3 on hppa: unexpected reloc type
Date: Mon, 14 Jun 2004 08:51:18 -0700
Message-ID: <20040614155118.GL19250@tausq.org>
References: <20040613223358.GJ19250@tausq.org>
	<200406140232.i5E2W5Bg003075@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rwhaley@cs.utk.edu,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200406140232.i5E2W5Bg003075@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Cool! Be aware that, if atlas relies on being able to prefetch invalid
> > addresses and have that not fault, then it will only work on some PA 
> > processors (mostly pa20) and not all of them.
> 
> Are you sure this doesn't apply to all pa20 processors?  See page 6-11
> in PA-RISC 2.0 Architecture book.

It does work on all pa20 processors, afaik. Let me rephrase:

"Be aware that, if atlas relies on being able to prefetch invalid
addresses and have that not fault, then it will only work on some PA 
processors but not all of them. All pa20 processors should work.
pa11 processors will not."

We ran into this while trying to get PA7300LC to do prefetching in the
kernel.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
