From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA glibc nls bug
Date: Sun, 22 Apr 2007 11:43:45 -0400 (EDT)
Message-ID: <200704221543.l3MFhjVi015765__15094.3380351693$1416624340$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440704220718o7eeeaf1u1e3c4841fa47e5ec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440704220718o7eeeaf1u1e3c4841fa47e5ec@mail.gmail.com> from
	"Carlos O'Donell" at Apr 22, 2007 10:18:20 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I has to change the printf slightly.

#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <langinfo.h>
#include <wchar.h>
int
main ()
{
  const char *ls = "zh_TW";
  locale_t loc;
  char *nl;
  int i;
  loc = newlocale (1 << LC_ALL, ls, 0);
  if (loc == NULL) return 1;
  nl = nl_langinfo_l (_NL_WD_FMT, loc);
  if (nl == NULL) return 1;
  for (i = 0; i < 16; i++)
    printf ("%02x", (unsigned char) nl[i]);
  printf ("\n");
  return 0;
}

> gcc -O0 -Wall -pedantic -g3 -D_GNU_SOURCE -o wchart wchart.c
> 
> On x86:
> 2500000059000000745e000025000000
> 
> On parisc:
> 000000250000005900005e7400000025

> I don't see any difference other than byte ordering?
> What are you seeing?

x86:
7f890000435100002500000059000000

parisc:
000000250000005900005e7400000025

If I extend the x86 printf to 24 bytes:
7f890000435100002500000059000000745e000025000000

The x86 result was done on a relatively old system (Suse).  Was
your x86 test done on a Debian system? 

This started as GCC PR 31413:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31413

The 4.cc test fails because this wchar string isn't being correctly
processed:

  const wchar_t wstr[] = { 0x897f, 0x5143, L'2', L'0', L'0', L'3',
			   0x5e74, L'1', L'2', 0x6708, L'1', L'7',
			   0x65e5 , 0x0 };

Note the first two values are the same as my x86 system returns.

Paolo said in comment 2 of the PR that all other linux systems are fine.
However, your x86 results would seem to indicate otherwise.

There does seem to be some assumptions being made about the alignment
of the pointers.  nl_langinfo_l returns a char * and not a wchar_t *.

The issue is clearly in newlocale.  nl_langinfo_l just returns
a pointer that was previously setup.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
