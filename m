From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] HPPA NPTL Support committed to libc-ports,	help
	needed!
Date: Sat, 15 Jul 2006 21:49:11 +0800
Message-ID: <44B8F257.2010900@tausq.org>
References: <119aab440607140756p569f4c28t4e2498969860f722@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607140756p569f4c28t4e2498969860f722@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> You will need:
> binutils head cvs newer than 2006-05-24.
> gcc cvs head newer than 2005-07-05 with TLS turned on.
> libc-ports cvs head newer than 2006-07-14
> glibc cvs head to match libc-ports.

FWIW, I'm seeing the following FAILs with gcc head built with binutils 
head (from yesterday)

                 === gcc Summary ===

# of expected passes            38513
# of unexpected failures        6
# of unexpected successes       1
# of expected failures          80
# of untested testcases         28
# of unsupported tests          359


FAIL: gcc.c-torture/compile/20001226-1.c  -O2  (test for excess errors)
FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -fomit-frame-pointer 
(test for excess errors)
FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -g  (test for excess errors)
FAIL: gcc.c-torture/compile/20001226-1.c  -Os  (test for excess errors)
FAIL: gcc.c-torture/execute/builtin-bitops-1.c execution,  -O3 
-fomit-frame-pointer -funroll-loops
FAIL: gcc.c-torture/execute/builtin-bitops-1.c execution,  -O3 
-fomit-frame-pointer -funroll-all-loops -finline-functions

glibc built and running make check now..

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
