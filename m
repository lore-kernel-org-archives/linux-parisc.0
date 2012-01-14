From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Kernel math emulation bug
Date: Sat, 14 Jan 2012 16:14:45 -0500
Message-ID: <20120114211445.GA5426@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following testcase fails when compiled with -march=2.0:

/* Test front-end conversions, optimizer conversions, and run-time
   conversions between different arithmetic types.

   Constants are specified in a non-obvious way to make them work for
   any word size.  Their value on a 32-bit machine is indicated in the
   comments.

   Note that this code is NOT intended for testing of accuracy of fp
   conversions.  */

unsigned long long int
f2ull(float f)
{
  return (unsigned long long int) f;
}

test_float_to_longlong_integer()
{
  if (f2ull((float) ((~0ULL) >> 1)) != (~0ULL) >> 1 &&	/* 0x7fffffff */
      f2ull((float) ((~0ULL) >> 1)) != ((~0ULL) >> 1) + 1)
    abort();
}

main()
{
  test_float_to_longlong_integer();
  exit(0);
}

The problem is the fcnv,t,sgl,udw instruction. It appears it isn't emulated
correctly.  Test doesn't fail on hpux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
