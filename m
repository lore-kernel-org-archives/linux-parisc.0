Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA3F5483F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 10:59:50 -0600 (MDT)
Date: Sun, 14 Jul 2002 18:58:42 +0200 (CEST)
From: Peter Mottram <peter@petescaff.com>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] compiling PINE under PARISC
In-Reply-To: <20020714162011.58440483E@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0207141854560.3013-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Are you trying to build pine from sources you have downloaded manually?

I have no problems building v4.44 using apt.....

just make sure you have some source lines in /etc/apt/sources.list - here
is my config for use here in NL (line-wrapped a little):

deb http://ftp.nl.debian.org/debian/ woody main non-free contrib
deb http://ftp.nl.debian.org/debian-non-US woody/non-US main non-free
contrib
deb-src http://ftp.nl.debian.org/debian/ woody main non-free contrib
deb-src http://ftp.nl.debian.org/debian-non-US woody/non-US main non-free
contrib
deb http://security.debian.org/ woody/updates main contrib non-free
deb-src http://security.debian.org/ woody/updates main contrib non-free

Then you can download and build pine perfectly using:

apt-get source pine --build

R.
PeteM

On Sun, 14 Jul 2002, Stephan Trajkoff wrote:

> cc    -g -DDEBUG   -DLNX -DSYSTYPE=\"LNX\" -DMOUSE -o pine addrbook.o
> adrbkcmd.o adrbklib.o args.o bldaddr.o context.o filter.o folder.o
> help.o helptext.o imap.o init.o mailcap.o mailcmd.o mailindx.o
> mailpart.o mailview.o newmail.o other.o pine.o reply.o screen.o
> send.o signals.o status.o strings.o takeaddr.o os.o
> date.c ../pico/libpico.a ../c-client/c-client.a  -lncurses `cat ../c-
> client/LDFLAGS`
> /usr/bin/ld: other.o(.text 0x3f730): cannot reach
> 000000d6_ClearScreen 0, recompile with -ffunction-sections
> /usr/bin/ld: other.o(.text 0x3f730): cannot handle R_PARISC_PCREL17F
> for ClearScreen
> /usr/bin/ld: final link failed: Bad value
> collect2: ld returned 1 exit status
> make: *** [pine] Error 1
>
> It is a error with ./build sl5 and slx
> same errors:(((
> can anyone help?
>
> -->> FREE Perl CGI scripts add WEB ACCESS to your
> -->> POP E-Mail accounts! Download today!! http://www.adjeweb.com
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
