Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server.da-kot (21-40.CampusNet.ucl.ac.be [130.104.21.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id A58EF482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 10:55:35 -0600 (MDT)
Received: from gmsoft.tuxicoman.be ([2001:6f8:204:20:210:a7ff:fe10:1a3e])
	by server.da-kot with esmtp (Exim 3.36 #1 (Debian))
	id 19Fd3u-0000E8-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 18:55:34 +0200
From: Guy Martin <gmsoft@gentoo.org>(by way of Guy Martin <gmsoft@gentoo.org>)
Subject: Re: [parisc-linux] gcc and -march=2.0 flag bug
Date: Tue, 13 May 2003 18:53:03 +0200
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_vLSw+yLci4siwBX"
Message-Id: <200305131853.03798.gmsoft@gentoo.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--Boundary-00=_vLSw+yLci4siwBX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> How are they "b0rked"? Can you be a bit more precise?

I've attached the the end of the compilation log of groff which fail with 
-march=2.0 in CXXFLAGS. The same compilation works perfectly without this 
flags or with -march=1.1 instead.

> We compile pa20 32-bit kernels (e.g. for c3k) using 32-bit and
> -march=2.0. seems to work. Do you have a test case for what you think
> is broken? -march2.0 is really orthogonal to 64-bit userspace.

After looking again more closely, it seems that only g++ is affected by this
bug. The kernel on the station was also compiled with -march=2.0.
About the test case, I don't have the time to look more to this problem but I
can give you a access to the box since it's a test box.

--
Guy Martin
Gentoo - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)



--Boundary-00=_vLSw+yLci4siwBX
Content-Type: text/x-log;
  charset="iso-8859-1";
  name="groff-march2.0-short.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="groff-march2.0-short.log"

    rm -f $m-wrap; \
    if test "$m" = an; then \
      echo .do mso andoc.tmac >>$m-wrap; \
    fi; \
    echo .cp 1 >>$m-wrap; \
    echo .so $m >>$m-wrap; \
  done; \
fi
touch stamp-wrap
for f in man.tmac ms.tmac; do \
  rm -f $f-sed; \
  sed -e "s;@TMAC_AN_PREFIX@;;g" \
  -e "s;@TMAC_S_PREFIX@;;g" \
  /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/tmac/$f > $f-sed; \
done
touch stamp-sed
Making groff_ms.n from groff_ms.man
Making groff_man.n from groff_man.man
Making groff_me.n from groff_me.man
Making groff_mdoc.n from groff_mdoc.man
Making groff_trace.n from groff_trace.man
Making groff_www.n from groff_www.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/tmac'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/utils/afmtodit'
if test -n "/usr/bin/perl"; then \
  sed -e "s|/usr/bin/perl|/usr/bin/perl|" \
              -e "s|@VERSION@|1.18.1|" \
              /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/utils/afmtodit/afmtodit.pl >afmtodit; \
else \
  sed -e "s|@VERSION@|1.18.1|" \
              /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/utils/afmtodit/afmtodit.pl afmtodit; \
fi
chmod +x afmtodit
Making afmtodit.n from afmtodit.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/utils/afmtodit'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/grog'
rm -f grog
sed -e "s|@g@||g" \
  -e "s|@VERSION@|1.18.1|" \
  -e 1s/a/a/ /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/grog/grog.sh >grog
chmod +x grog
Making grog.n from grog.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/grog'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/nroff'
rm -f nroff
sed -e "s|@BINDIR@|/usr/bin|g" \
-e 1s/a/a/ \
-e "s|@VERSION@|1.18.1|" /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/nroff/nroff.sh >nroff
chmod +x nroff
Making nroff.n from nroff.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/nroff'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/mm'
rm -f mmroff
sed -e 's;/usr/bin/perl;/usr/bin/perl;' /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/mm/mmroff.pl >mmroff
chmod +x mmroff
Making mmroff.n from mmroff.man
Making groff_mm.n from groff_mm.man
Making groff_mmse.n from groff_mmse.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/mm'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/pic2graph'
rm -f pic2graph; \
sed -e "s|@g@||g" \
    -e "s|@VERSION@|1.18.1|" \
    -e 1s/a/a/ /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/pic2graph/pic2graph.sh >pic2graph; \
chmod +x pic2graph
Making pic2graph.n from pic2graph.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/pic2graph'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/eqn2graph'
rm -f eqn2graph; \
sed -e "s|@g@||g" \
    -e "s|@VERSION@|1.18.1|" \
    -e 1s/a/a/ /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/eqn2graph/eqn2graph.sh >eqn2graph; \
chmod +x eqn2graph
Making eqn2graph.n from eqn2graph.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/eqn2graph'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/groffer'
rm -f groffer; \
sed -e "s|@g@||g" \
    -e "s|@VERSION@|1.18.1|" \
    -e 1s/a/a/ /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/groffer/groffer.sh >groffer; \
chmod +x groffer
Making groffer.n from groffer.man
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/groffer'
make[2]: Entering directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/mom'
test -d examples || /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/mkinstalldirs examples
test -f penguin.ps || cp /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/mom/examples/penguin.ps .
GROFF_COMMAND_PREFIX=''; export GROFF_COMMAND_PREFIX; GROFF_BIN_PATH=`echo /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/groff /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/troff /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/devices/grops | sed -e 's|  *|:|g'`; export GROFF_BIN_PATH; /var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/groff/groff -F/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/font -F/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/font -M/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/tmac -M/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/tmac -M/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/mom -Tps -mom examples/letter.mom >examples/letter.ps
troff: Failed assertion at line 654, file `number.cc'.
/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/src/roff/groff/groff: troff: Aborted
grops:<standard input>:5:warning: no final `x stop' command
make[2]: *** [examples/letter.ps] Error 2
make[2]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1/contrib/mom'
make[1]: *** [contrib/mom] Error 2
make[1]: Leaving directory `/var/tmp/portage/groff-1.18.1-r2/work/groff-1.18.1'
make: *** [all] Error 2

!!! ERROR: sys-apps/groff-1.18.1-r2 failed.
!!! Function src_compile, Line 57, Exitcode 2
!!! (no error message)


--Boundary-00=_vLSw+yLci4siwBX--
