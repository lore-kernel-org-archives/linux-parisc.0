Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA31513
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 13:57:35 -0600
Message-Id: <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
Date: Thu, 26 Oct 2000 12:56:47 -0700
To: Alan Modra <alan@linuxcare.com.au>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] glibc problem
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0010261402360.31251-100000@front.linuxcare.c
 om.au>
References: <5.0.0.25.0.20001025173830.00a64a30@mail.webcash.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_5144707==_.ALT"
List-ID: <linux-parisc.vger.kernel.org>

--=====================_5144707==_.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

HI alan,

I did upgrade to latest glibc from the cvs and tried I still get the same 
error. Actually I restarted from scratch starting from binutils. I have 
seen some warning while I built gcc. The smallpart of gcc warnings are as 
follows:

Gcc warnings:

prototypes -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. 
-I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include 
/opt/hp/gcc/gcc/explow.c
/usr/include/bits/string2.h: In function `__stpcpy_small':
In file included from /usr/include/string.h:346,
                  from /opt/hp/gcc/gcc/system.h:176,
                  from /opt/hp/gcc/gcc/explow.c:24:
/usr/include/bits/string2.h:611: warning: pointer targets in return differ 
in signedness
gcc -c -DCROSS_COMPILE -DIN_GCC    -g -O2 -W -Wall -Wtraditional 
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic 
-Wno-long-long  -DHAVE_CONFIG_H    -I. -I/opt/hp/gcc/gcc 
-I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include /opt/hp/gcc/gcc/optabs.c
/usr/include/bits/string2.h: In function `__stpcpy_small':
In file included from /usr/include/string.h:346,
                  from /opt/hp/gcc/gcc/system.h:176,
                  from /opt/hp/gcc/gcc/optabs.c:24:
/usr/include/bits/string2.h:611: warning: pointer targets in return differ 
in signedness
gcc -c -DCROSS_COMPILE -DIN_GCC    -g -O2 -W -Wall -Wtraditional 
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic 
-Wno-long-long  -DHAVE_CONFIG_H    -I. -I/opt/hp/gcc/gcc 
-I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include /opt/hp/gcc/gcc/real.c
/usr/include/bits/string2.h: In function `__stpcpy_small':
In file included from /usr/include/string.h:346,
                  from /opt/hp/gcc/gcc/system.h:176,
                  from /opt/hp/gcc/gcc/real.c:25:
/usr/include/bits/string2.h:611: warning: pointer targets in return differ 
in signedness
gcc -c -DCROSS_COMPILE -DIN_GCC    -g -O2 -W -Wall -Wtraditional 
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic 
-Wno-long-long  -DHAVE_CONFIG_H    -I. -I/opt/hp/gcc/gcc 
-I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include 
/opt/hp/gcc/gcc/builtins.c
/usr/include/bits/string2.h: In function `__stpcpy_small':
In file included from /usr/include/string.h:346,
                  from /opt/hp/gcc/gcc/system.h:176,
                  from /opt/hp/gcc/gcc/builtins.c:23:
/usr/include/bits/string2.h:611: warning: pointer targets in return differ 
in signedness
gcc -DCROSS_COMPILE -DIN_GCC    -g -O2 -W -Wall -Wtraditional 
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic 
-Wno-long-long  -DHAVE_CONFIG_H    -I. -I/opt/hp/gcc/gcc 
-I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include \
   -DLOCALEDIR=\"/opt/hpboot/share/locale\" \
   -c `echo /opt/hp/gcc/gcc/intl.c | sed 's,^\./,,'`
gcc -c -DCROSS_COMPILE -DIN_GCC    -g -O2 -W -Wall -Wtraditional 
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic 
-Wno-long-long  -DHAVE_CONFIG_H    -I. -I/opt/hp/gcc/gcc 
-I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include /opt/hp/gcc/gcc/varasm.c
/usr/include/bits/string2.h: In function `__stpcpy_small':
In file included from /usr/include/string.h:346,
                  from /opt/hp/gcc/gcc/system.h:176,
                  from /opt/hp/gcc/gcc/varasm.c:31:
/usr/include/bits/string2.h:611: warning: pointer targets in return differ 
in signedness
gcc -c -DCROSS_COMPILE -DIN_GCC    -g -O2 -W -Wall -Wtraditional 
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic 
-Wno-long-long  -DHAVE_CONFIG_H    -I. -I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/c


At 02:27 PM 10/26/00 +1100, Alan Modra wrote:
>On Wed, 25 Oct 2000, Kailashnath V Rampure wrote:
>
> > Hi
> >
> > I have upgraded to GNU Make version 3.79.1 but when i run make its is
> > giving following error:
> >
> > Regards
> > Kailas
> >
> > hppa-linux-gcc -nostdlib -nostartfiles -r -o 
> /opt/hp/build/glibc/csu/crt1.o
> > /opt/hp/build/glibc/csu/start.o /opt/hp/build/glibc/csu/abi-note.o
> > /opt/hp/build/glibc/csu/init.o
> > hppa-linux-gcc -nostdlib -nostartfiles -r -o
> > /opt/hp/build/glibc/csu/gcrt1.o /opt/hp/build/glibc/csu/crt1.o
> > /opt/hp/build/glibc/csu/gmon-start.o
> > cp /dev/null /opt/hp/build/glibc/csu/Mcrt1.c
>
>Hmm, my make.log shows a difference here.  I have echo > ...Mcrt1.c, which
>creates a 1 byte dummy file rather than the zero byte file you get from cp
>/dev/null.  Bombing on an empty input file is a known gcc bug for the
>snapshot we took of the Cygnus development gcc sources.
>
>I suggest you update your glibc sources.
>
>--
>Linuxcare.  Support for the Revolution.
>
>---------------------------------------------------------------------------
>To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
>`unsubscribe' as the subject.

--=====================_5144707==_.ALT
Content-Type: text/html; charset="us-ascii"

<html>
HI alan,<br>
<br>
I did upgrade to latest glibc from the cvs and tried I still get the same
error. Actually I restarted from scratch starting from binutils. I have
seen some warning while I built gcc. The smallpart of gcc warnings are as
follows:<br>
<br>
Gcc warnings:<br>
<br>
prototypes -pedantic -Wno-long-long&nbsp;
-DHAVE_CONFIG_H&nbsp;&nbsp;&nbsp; -I. -I/opt/hp/gcc/gcc
-I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include
/opt/hp/gcc/gcc/explow.c<br>
/usr/include/bits/string2.h: In function `__stpcpy_small':<br>
In file included from /usr/include/string.h:346,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/system.h:176,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/explow.c:24:<br>
<b>/usr/include/bits/string2.h:611: warning: pointer targets in return
differ in signedness<br>
</b>gcc -c -DCROSS_COMPILE -DIN_GCC&nbsp;&nbsp;&nbsp; -g -O2 -W -Wall
-Wtraditional -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-pedantic -Wno-long-long&nbsp; -DHAVE_CONFIG_H&nbsp;&nbsp;&nbsp; -I.
-I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include
/opt/hp/gcc/gcc/optabs.c<br>
/usr/include/bits/string2.h: In function `__stpcpy_small':<br>
In file included from /usr/include/string.h:346,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/system.h:176,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/optabs.c:24:<br>
/usr/include/bits/string2.h:611: warning: pointer targets in return
differ in signedness<br>
gcc -c -DCROSS_COMPILE -DIN_GCC&nbsp;&nbsp;&nbsp; -g -O2 -W -Wall
-Wtraditional -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-pedantic -Wno-long-long&nbsp; -DHAVE_CONFIG_H&nbsp;&nbsp;&nbsp; -I.
-I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include
/opt/hp/gcc/gcc/real.c<br>
/usr/include/bits/string2.h: In function `__stpcpy_small':<br>
In file included from /usr/include/string.h:346,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/system.h:176,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/real.c:25:<br>
<b>/usr/include/bits/string2.h:611: warning: pointer targets in return
differ in signedness<br>
</b>gcc -c -DCROSS_COMPILE -DIN_GCC&nbsp;&nbsp;&nbsp; -g -O2 -W -Wall
-Wtraditional -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-pedantic -Wno-long-long&nbsp; -DHAVE_CONFIG_H&nbsp;&nbsp;&nbsp; -I.
-I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include
/opt/hp/gcc/gcc/builtins.c<br>
/usr/include/bits/string2.h: In function `__stpcpy_small':<br>
In file included from /usr/include/string.h:346,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/system.h:176,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/builtins.c:23:<br>
/usr/include/bits/string2.h:611: warning: pointer targets in return
differ in signedness<br>
gcc -DCROSS_COMPILE -DIN_GCC&nbsp;&nbsp;&nbsp; -g -O2 -W -Wall
-Wtraditional -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-pedantic -Wno-long-long&nbsp; -DHAVE_CONFIG_H&nbsp;&nbsp;&nbsp; -I.
-I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include
\<br>
&nbsp; -DLOCALEDIR=\&quot;/opt/hpboot/share/locale\&quot; \<br>
&nbsp; -c `echo /opt/hp/gcc/gcc/intl.c | sed 's,^\./,,'`<br>
gcc -c -DCROSS_COMPILE -DIN_GCC&nbsp;&nbsp;&nbsp; -g -O2 -W -Wall
-Wtraditional -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-pedantic -Wno-long-long&nbsp; -DHAVE_CONFIG_H&nbsp;&nbsp;&nbsp; -I.
-I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include
/opt/hp/gcc/gcc/varasm.c<br>
/usr/include/bits/string2.h: In function `__stpcpy_small':<br>
In file included from /usr/include/string.h:346,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/system.h:176,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
from /opt/hp/gcc/gcc/varasm.c:31:<br>
/usr/include/bits/string2.h:611: warning: pointer targets in return
differ in signedness<br>
gcc -c -DCROSS_COMPILE -DIN_GCC&nbsp;&nbsp;&nbsp; -g -O2 -W -Wall
-Wtraditional -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-pedantic -Wno-long-long&nbsp; -DHAVE_CONFIG_H&nbsp;&nbsp;&nbsp; -I.
-I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/c<br>
<br>
<br>
At 02:27 PM 10/26/00 +1100, Alan Modra wrote:<br>
<blockquote type=cite class=cite cite>On Wed, 25 Oct 2000, Kailashnath V
Rampure wrote:<br>
<br>
&gt; Hi<br>
&gt; <br>
&gt; I have upgraded to GNU Make version 3.79.1 but when i run make its
is <br>
&gt; giving following error:<br>
&gt; <br>
&gt; Regards<br>
&gt; Kailas<br>
&gt; <br>
&gt; hppa-linux-gcc -nostdlib -nostartfiles -r -o
/opt/hp/build/glibc/csu/crt1.o <br>
&gt; /opt/hp/build/glibc/csu/start.o /opt/hp/build/glibc/csu/abi-note.o
<br>
&gt; /opt/hp/build/glibc/csu/init.o<br>
&gt; hppa-linux-gcc -nostdlib -nostartfiles -r -o <br>
&gt; /opt/hp/build/glibc/csu/gcrt1.o /opt/hp/build/glibc/csu/crt1.o 
<br>
&gt; /opt/hp/build/glibc/csu/gmon-start.o<br>
&gt; cp /dev/null /opt/hp/build/glibc/csu/Mcrt1.c<br>
<br>
Hmm, my make.log shows a difference here.&nbsp; I have echo &gt;
...Mcrt1.c, which<br>
creates a 1 byte dummy file rather than the zero byte file you get from
cp<br>
/dev/null.&nbsp; Bombing on an empty input file is a known gcc bug for
the<br>
snapshot we took of the Cygnus development gcc sources.<br>
<br>
I suggest you update your glibc sources.<br>
<br>
-- <br>
Linuxcare.&nbsp; Support for the Revolution.<br>
<br>
---------------------------------------------------------------------------<br>
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with<br>
`unsubscribe' as the subject.</blockquote></html>

--=====================_5144707==_.ALT--
