From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: GCC 4.3 and PLABEL32 issues.
Date: Tue, 25 Mar 2008 22:59:05 -0400
Message-ID: <119aab440803251959j8596a72wc399174db02ed71f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: "John David Anglin" <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Aurelien Jarno" <aurel32@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

The following reduced testcase:

cat >> foo.c <<EOF
#include <stdio.h>
#include <stdlib.h>

int main (void) {
  printf ("&printf = %x\n", (unsigned long)&printf);
  if (((unsigned long) &printf) & 3)
    {
      printf ("printf is a PLABEL32\n");
    }
  return 0;
}
EOF

carlos@firin:~/fsrc/gcc-work$
/usr/local/tools/bin/hppa-linux-gcc-4.2.4 -o foo foo.c
carlos@firin:~/fsrc/gcc-work$ ./foo
&printf = 119ea
printf is a PLABEL32

carlos@firin:~/fsrc/gcc-work$
/usr/local/tools/bin/hppa-linux-gcc-4.3.1 -o foo foo.c
carlos@firin:~/fsrc/gcc-work$ ./foo
&printf = 119ea

GCC 4.3, even at -O0, reduces "((unsigned long) &printf) & 3)" to "0".

~~~ foo.c.003t.original ~~~
;; Function main (main)
;; enabled by -tree-original

{
  printf ((const char * restrict) (char *) "&printf = %x\n", (long
unsigned int) printf);
  if (0)
    {
      printf ((const char * restrict) (char *) "printf is a PLABEL32\n");
    }
  return 0;
}
~~~
If the if condition is reduced to "0" as early as 003t.original, does
that mean it's the C frontend fault?

This issue is breaks glibc's detection of PLABEL's during startup
relocation processing.

Cheers,
Carlos.
