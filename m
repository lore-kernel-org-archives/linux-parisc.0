Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA12121
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 15:19:51 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 10 Jul 2000 21:21:19 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13BkyL-00057P-00
	for <parisc-linux@thepuffingroup.com>; Mon, 10 Jul 2000 17:20:13 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 10 Jul 2000 17:20:11 -0400
Message-ID: <87wvitbs38.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 64-bit compiler
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've just checked in the requisite configuration bits (and fixed a
buglet in BFD) to make it possible to build a 64-bit toolchain.  As
expected, merging forward to 2.96 made this a lot easier.

I have no idea whether it generates correct binaries or not, of course.

To try it out, this short recipe should do:

mkdir binutils-64-build && cd binutils-64-build
../binutils-2.10/configure --disable-nls --target=hppa64-linux
make
make install

cd ..
mkdir gcc-64-build && cd gcc-64-build
../gcc/configure --target=hppa64-linux --enable-languages=c \
        --disable-nls --disable-multilib
make
make install

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
