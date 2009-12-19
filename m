From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: vfork test case.
Date: Sat, 19 Dec 2009 13:44:41 -0700
Message-ID: <20091219204441.GB7952@lackof.org>
References: <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca> <4B2A82AA.10907@gmx.de> <119aab440912171239hf2ecc6fq86795f100a1e3fbc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912171239hf2ecc6fq86795f100a1e3fbc@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 17, 2009 at 03:39:02PM -0500, Carlos O'Donell wrote:
> On Thu, Dec 17, 2009 at 2:12 PM, Helge Deller <deller@gmx.de> wrote:
> > I couldn't reproduce on my SMP box either (but it's PA8500 instead =
of
> > PA8700):
> > cpu =A0 =A0 =A0 =A0 =A0 =A0 : PA8500 (PCX-W)
> > model =A0 =A0 =A0 =A0 =A0 : 9000/785/J5000
> > Linux ls3017 2.6.32-32bit #79 SMP Thu Dec 3 14:04:53 CET 2009 paris=
c
> > GNU/Linux
>=20
> Thanks Helge. This was a 64-bit box with SMP. It's possible part of
> the 64-bit kernel is being incorrectly compiled.
>=20
> I am not yet able to boot 2.6.32.
>=20
> I'm getting problems in the initrd while waiting for /dev/sda1 to
> appear, but it never does.

hrm..there is a module option to force SCSI Async scan to complete
before calling into user space. Perhaps that is the problem?

=46WIW, I've been moving all machine to "mount by Label" or UUID.

cheers,
grant


>=20
> Once I resolve that I will see if the testcase works with 2.6.32.
>=20
> Cheers,
> Carlos.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
