Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA26646
	for <parisc-linux@puffin.external.hp.com>; Mon, 3 Apr 2000 08:14:56 -0600
From: BOSCHINI@ICIL64.CILEA.IT
Date: Mon, 03 Apr 2000 16:14:18 +0000 (MET-01DST)
To: PARISC-LINUX@THEPUFFINGROUP.COM
Message-id: <01JNSZTI58320010PS@ICIL64.CILEA.IT>
MIME-version: 1.0
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Subject: [parisc-linux] PALO on HP 735 10.20

hello all, 

I have another stupid question. 

I partally succeeded in gmak-ing oldconfig and dep, except for those 

/bin/bash: invalid character 45 in exportstr for DRIVERS-y 
/bin/bash: invalid character 45 in exportstr for DRIVERS- 
/bin/bash: invalid character 45 in exportstr for DRIVERS-m 
/bin/bash: invalid character 45 in exportstr for DRIVERS-n 

errors.

I then did a gmake vmlinux, in order to try the PALO build as reported in
palo's docs, getting the same errors, even though gmake goes on
till what looks like a reasonable end.

I downloaded a ramdisk.bin and moved to compile PALO. 

I do a 

bash-2.04# gmake

and this is what happens:

echo NATIVE=/TMP/palo/../linux-2.3
NATIVE=/TMP/palo/../linux-2.3
cd palo && make
        echo "char *bld_info = \"`whoami`@`hostname` `date`\";" > build.c
        gcc -O -I/TMP/palo/../linux-2.3/include -I../include -I../lib -c -o
build.o build.c
        rm -f build.c
        gcc -O -I/TMP/palo/../linux-2.3/include -I../include -I../lib  -o palo
diskpart.o    elf64.o        load.o        paloio.o      som.o  elf32.o       
error.o       palo.o build.o
        rm -f build.o
cd ipl && make
Make: Don't know how to make crt0.o.  Stop.
gmake: *** [makeipl] Error 1

any help ? 

I installed linux more than once on x86 boioxes with no problem, but I am a
little confused here....

thanks in advance, 

Matteo Boschini
