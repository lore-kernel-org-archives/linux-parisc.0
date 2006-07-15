From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] HPPA NPTL Support committed to libc-ports,   help
Date: Sat, 15 Jul 2006 14:07:36 -0400 (EDT)
Message-ID: <200607151807.k6FI7bXl013224@hiauly1.hia.nrc.ca>
References: <44B8F257.2010900@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44B8F257.2010900@tausq.org> from "Randolph Chung" at Jul 15,
	2006 09:49:11 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> FAIL: gcc.c-torture/compile/20001226-1.c  -O2  (test for excess errors)
> FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -fomit-frame-pointer 
> (test for excess errors)
> FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -g  (test for excess errors)
> FAIL: gcc.c-torture/compile/20001226-1.c  -Os  (test for excess errors)

GCC is slower than it used to be...

> FAIL: gcc.c-torture/execute/builtin-bitops-1.c execution,  -O3 
> -fomit-frame-pointer -funroll-loops
> FAIL: gcc.c-torture/execute/builtin-bitops-1.c execution,  -O3 
> -fomit-frame-pointer -funroll-all-loops -finline-functions

This is a known regression.  See
<http://gcc.gnu.org/bugzilla/show_bug.cgi?id=26244>.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
