From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: FSF GDB 7.1.50 from CVS head works better than GDB in Debian
	unstable.
Date: Wed, 31 Mar 2010 10:53:08 -0400
Message-ID: <o2p119aab441003310753ma764ec4do48e1cbf4afe569d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

The FSF GDB 7.1.50 from CVS head performs much better than the default
GDB in Debian unstable.

I highly recommend building it from source and using it for debugging.

It also has the new `=>` PC pointer when you dissassemble...

   0x413deed4 <+220>:   cmpb,= ret0,ret1,0x413def44 <_dl_make_fptr+332>
   0x413deed8 <+224>:   shladd,l rp,3,r5,rp
=> 0x413deedc <+228>:   ldw 8(r5),ret1
   0x413deee0 <+232>:   ldw 4(r5),ret0
   0x413deee4 <+236>:   cmpb,<<= ret0,ret1,0x413deffc <_dl_make_fptr+516>
   0x413deee8 <+240>:   ldo 1(ret1),rp

Which is handy.

Cheers,
Carlos.
