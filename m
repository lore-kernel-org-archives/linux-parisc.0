Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id UAA14206
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 20:20:29 -0700
Message-Id: <200101170323.WAA08747@hiauly1.hia.nrc.ca>
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
To: alan@linuxcare.com.au (Alan Modra)
Date: Tue, 16 Jan 2001 22:23:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rth@redhat.com, law@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
In-Reply-To: <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au> from "Alan Modra" at Jan 16, 2001 08:28:12 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> OK, here we go.

I am currently bootstrapping with the patch.  However, we still have the
prologue ICE warning which Kenner wants to turn into an abort:

./xgcc -B./ -B/usr/local/hppa1.1-hp-hpux10.20/bin/ -isystem /usr/local/hppa1.1-hp-hpux10.20/include -O2   -DIN_GCC    -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include  -fPIC -g1  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I. -I../../gcc -I../../gcc/. -I../../gcc/config -I../../gcc/../include -DUSE_COLLECT2 -DL_floatditf -c ../../gcc/libgcc2.c -o libgcc/./_floatditf.o
../../gcc/libgcc2.c: In function `__floatditf':
../../gcc/libgcc2.c:1043: warning: ICE: would have deleted prologue/epilogue ins
n
(insn 372 370 373 (set (reg:SI 4 %r4 [94])
        (reg:SI 19 %r19)) -1 (nil)
    (nil))

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
