Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA07221
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 19:00:52 -0600
Message-Id: <5.0.0.25.0.20001026163140.00aed760@mail.webcash.com>
Date: Thu, 26 Oct 2000 17:58:03 -0700
To: taggart@carmen.fc.hp.com
From: Kailashnath V Rampure <kailasr@webcash.com>
Cc: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_23220339==_.ALT"
Subject: [parisc-linux] Make palo problem
List-ID: <linux-parisc.vger.kernel.org>

--=====================_23220339==_.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed


    * I have down loaded the latest prebuilt cross-compiler  and untared it 
the a directory by name DEST
    * I have downloaded the Latest linux  and palo files from the cvs. the 
after uncompresing them I run the following command from the ~/linux directory
    * Changed the line in Palo/Makefile  for my system IP Address
    * exported PATH=$DEST/bin:$PATH
    * the cd ~/linux
    * make oldconfig
    * make dep
    * make clean
    * make palo
If so the I am getting the following error after running make palo
cd palo && make
make[2]: Entering directory `/cvs/palo/palo'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/cvs/palo/palo'
cd ipl && make
make[2]: Entering directory `/cvs/palo/ipl'
echo "char *bld_info = \"`whoami`@`hostname` `date`\";" > build.c
hppa-linux-gcc -I. -I../lib -I../include -O2 -fwritable-strings 
-mdisable-fpregs -Wall -c -o build.o build.c
rm -f build.c
hppa-linux-ld -N --Ttext 0x500000 -e '$START$' -o iplelf crt0.o ipl.a 
build.o `hppa-linux-gcc -print-libgcc-file-name`
ipl.a: could not read symbols: Archive has no index; run ranlib to add one
make[2]: *** [iplelf] Error 1
make[2]: Leaving directory `/cvs/palo/ipl'
make[1]: *** [makeipl] Error 2
make[1]: Leaving directory `/cvs/palo'
make: *** [palo] Error 2

--=====================_23220339==_.ALT
Content-Type: text/html; charset="us-ascii"

<html>

<ul>
<li>I have down loaded the latest prebuilt cross-compiler&nbsp; and
untared it the a directory by name DEST
<li>I have downloaded the Latest linux&nbsp; and palo files from the cvs.
the after uncompresing them I run the following command from the ~/linux
directory
<li>Changed the line in Palo/Makefile&nbsp; for my system IP Address
<li>exported PATH=$DEST/bin:$PATH
<li>the cd ~/linux
<li>make oldconfig
<li>make dep
<li>make clean
<li>make palo
</ul>If so the I am getting the following error after running make
palo<br>
cd palo &amp;&amp; make<br>
make[2]: Entering directory `/cvs/palo/palo'<br>
make[2]: Nothing to be done for `all'.<br>
make[2]: Leaving directory `/cvs/palo/palo'<br>
cd ipl &amp;&amp; make<br>
make[2]: Entering directory `/cvs/palo/ipl'<br>
echo &quot;char *bld_info = \&quot;`whoami`@`hostname`
`date`\&quot;;&quot; &gt; build.c<br>
hppa-linux-gcc -I. -I../lib -I../include -O2 -fwritable-strings
-mdisable-fpregs -Wall -c -o build.o build.c<br>
rm -f build.c<br>
hppa-linux-ld -N --Ttext 0x500000 -e '$START$' -o iplelf crt0.o ipl.a
build.o `hppa-linux-gcc -print-libgcc-file-name`<br>
ipl.a: could not read symbols: Archive has no index; run ranlib to add
one<br>
make[2]: *** [iplelf] Error 1<br>
make[2]: Leaving directory `/cvs/palo/ipl'<br>
make[1]: *** [makeipl] Error 2<br>
make[1]: Leaving directory `/cvs/palo'<br>
make: *** [palo] Error 2<br>
</html>

--=====================_23220339==_.ALT--
