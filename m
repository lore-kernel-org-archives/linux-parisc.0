Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 58440483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 10:20:11 -0600 (MDT)
Date: Sun, 14 Jul 2002 19:21:42 +0300
From: "Stephan Trajkoff" <stephan@itp.bg>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020714162011.58440483E@dsl2.external.hp.com>
Subject: [parisc-linux] compiling PINE under PARISC
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

cc    -g -DDEBUG   -DLNX -DSYSTYPE=3D\"LNX\" -DMOUSE -o pine addrbook.o=20
adrbkcmd.o adrbklib.o args.o bldaddr.o context.o filter.o folder.o=20
help.o helptext.o imap.o init.o mailcap.o mailcmd.o mailindx.o=20
mailpart.o mailview.o newmail.o other.o pine.o reply.o screen.o=20
send.o signals.o status.o strings.o takeaddr.o os.o=20
date.c ../pico/libpico.a ../c-client/c-client.a  -lncurses `cat ../c-
client/LDFLAGS`
/usr/bin/ld: other.o(.text 0x3f730): cannot reach=20
000000d6_ClearScreen 0, recompile with -ffunction-sections
/usr/bin/ld: other.o(.text 0x3f730): cannot handle R_PARISC_PCREL17F=20
for ClearScreen
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status
make: *** [pine] Error 1

It is a error with ./build sl5 and slx
same errors:(((
can anyone help?

-->> FREE Perl CGI scripts add WEB ACCESS to your
-->> POP E-Mail accounts! Download today!! http://www.adjeweb.com
