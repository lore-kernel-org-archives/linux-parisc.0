From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] (hppa glibc 2.3.3 exp.) Recompile expect, then
Date: Mon, 27 Sep 2004 00:32:15 -0400 (EDT)
Message-ID: <200409270432.i8R4WFrC013637@hiauly1.hia.nrc.ca>
References: <20040927042212.GN27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040927042212.GN27033@baldric.uwo.ca> from "Carlos O'Donell" at
	Sep 27, 2004 00:22:13 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I ran my own. How does this look? I don't like the SEGV there...

Not good.  See <http://gcc.gnu.org/ml/gcc-testresults/2004-09/msg01180.html>.

> FAIL: gcc.c-torture/compile/20020807-1.c  -O3 -fomit-frame-pointer  (test
> for excess errors)
> FAIL: gcc.c-torture/compile/20020807-1.c  -O3 -g  (test for excess errors)
> FAIL: gcc.c-torture/compile/20040602-1.c  -O0  (test for excess errors)
> FAIL: gcc.c-torture/compile/20040602-1.c  -O1  (test for excess errors)
> FAIL: gcc.c-torture/compile/20040602-1.c  -O2  (test for excess errors)
> FAIL: gcc.c-torture/compile/20040602-1.c  -O3 -fomit-frame-pointer  (test
> for excess errors)
> FAIL: gcc.c-torture/compile/20040602-1.c  -O3 -g  (test for excess errors)
> FAIL: gcc.c-torture/compile/20040602-1.c  -Os  (test for excess errors)

I've never seen these fail.  Look in gcc.log.  I may provide some
clues.  If not, compile the test manually and see what's wrong.

Most of the gcc suite doesn't use glibc much.  Thus, it may be gcc
has been miscompiled.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
