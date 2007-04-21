From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] PA glibc nls bug
Date: Sat, 21 Apr 2007 12:32:20 -0400 (EDT)
Message-ID: <200704211632.l3LGWKms025929__22349.9140622609$1416624338$gmane$org@hiauly1.hia.nrc.ca>
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

In the following test program, the call to nl_langinfo_l returns an
incorrect wchar_t string.  We are dropping the first two wide chars:
0x0000897f 0x00005143.  You can see the difference by running this
test on x86 and parisc under gdb, or by printing pp.

#include <locale.h>
#include <langinfo.h>
#include <wchar.h>
wchar_t *
foo (void)
{
  char *__s = "zh_TW";
  wchar_t *pp;
  locale_t loc;
  union { char *__s; wchar_t *__w; } __u;

  loc = newlocale(1 << LC_ALL, __s, 0);
  __u.__s = nl_langinfo_l(_NL_WD_FMT, loc);
  pp = __u.__w;
  return pp;
}
int
main ()
{
  wchar_t *pp;
  pp = foo ();
  return 0;
}

This problem breaks locale support in libstdc++.

I didn't notice this until recently because I didn't have all the locales
needed for the libstdc++ testsuite.  So, the tests using named locales
were skipped.

It's easy to add the necessary locales.  Just add the following to
/etc/locale.gen:

# For libstdc++
de_DE ISO-8859-1
de_DE@euro ISO-8859-15
en_HK ISO-8859-1
en_PH ISO-8859-1
es_ES ISO-8859-1
es_MX ISO-8859-1
fr_FR ISO-8859-1
fr_FR@euro ISO-8859-15
is_IS ISO-8859-1
is_IS.UTF-8 UTF-8
it_IT ISO-8859-1
ja_JP.EUC-JP EUC-JP
se_NO UTF-8
ta_IN UTF-8
zh_TW BIG5
zh_TW.UTF-8 UTF-8
zh_TW.EUC-TW EUC-TW

Then, make the locales available using locale-gen.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
