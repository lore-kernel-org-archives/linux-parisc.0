Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA24311
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 17:29:21 -0700
Message-ID: <3830A4C6.C2CB788@nrc.ca>
Date: Mon, 15 Nov 1999 19:26:49 -0500
From: John David Anglin <dave.anglin@nrc.ca>
Reply-To: dave.anglin@nrc.ca
MIME-Version: 1.0
To: frowand@cup.hp.com
CC: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com>
Content-Type: text/plain; charset=us-ascii; x-mac-type="54455854"; x-mac-creator="4D4F5353"
List-ID: <linux-parisc.vger.kernel.org>

Frank Rowand wrote:

> This is just one of several recent messages dealing with the issues caused by
> locating the kernel at virtual address 0xc0000000 instead of 0x00000000.  I
> still don't understand why the kernel can't be at zero, even though several
> people have tried to explain it to me.  Can anyone provide a clear
> explanation?

I must admit I don't understand it either.  One consequence is that the kernel no
longer boots using the hpux ipl command without running som_relocate on the kernel.
This messes up the object file so debuggers will have to be specially modified for
this configuration.  It also means that virtual and physical addresses are different
for most of the kernel.  I think it was done to simplify the syscall interface.
However, maybe instead of different real and virtual code, the kernel should have
different syscall and real-virtual code.  I am not an expert but I think this is how
it is done with hpux.  It is linked at ~0 (0x11000 for 10.20).
