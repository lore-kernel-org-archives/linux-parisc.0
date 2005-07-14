From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Wed, 13 Jul 2005 22:53:50 -0400 (EDT)
Message-ID: <200507140253.j6E2ro4A022061@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The enclosed testcase derived from GCC PR 22474 aborts under linux but
not under hpux.  The problem is the following insn:

0x00002930 <f2ull+24>:  fcnv,t,sgl,udw fr22,fr22

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

/* gcc -w -o pr22474 -O0 -march=2.0 -fno-show-column pr22474.c */
unsigned long long
f2ull(float f)
{
  return (unsigned long long int) f;
}

int
main ()
{
  if (f2ull((float) ((~0ULL) >> 1)) != (~0ULL) >> 1 &&  /* 0x7fffffff */
      f2ull((float) ((~0ULL) >> 1)) != ((~0ULL) >> 1) + 1)
    abort();
  return 0;
}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
