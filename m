Return-Path: <pjlahaie@puffingroup.com>
Sender: pjlahaie@puffingroup.com
Message-ID: <36C0C5EC.D2057CEC@atlsci.com>
Date: Tue, 09 Feb 1999 18:34:04 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@atlsci.com>
MIME-Version: 1.0
To: hppa-linux@puffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] egcs / binutils x-compiler status
Resent-Message-ID: <"oyCEd.0.dQ2.J6Ems"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


    Earlier today I managed to get my first hppa-elf binary generated. 
I'm currently in the position to attempt patching the egcs build
environment to properly handle
both libmilli.a (which I believe for cross-compiling purposes should be
libgcc1.a)
and crt0.o which is required to define $global$ and $START$ symbols.  I
hope to
have everything wrapped up tonight or tomorrow so everyone can start
building
hppa-elf binaries (especially kernel bins :-) ).

    If anyone wants to give me any pointers on how to go about putting
those
things in the egcs build tree, feel free, it would be greatly
appreciated.

    Also, since I didn't patch the ld scripts in the way MkLinux did,
I'm not
sure what the status of the resulting bins will be.  I'm attempting to
stray
the least from the standard hppaelf target, which I believe will be a
win in
the future.

						- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
