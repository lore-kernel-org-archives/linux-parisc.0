Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13256
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 12:05:48 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A4A3D87.8EE7FCF1@dot.at>
Date: Wed, 27 Dec 2000 20:05:43 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Matt Taggart <taggart@carmen.fc.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Same boot problem on a 9000/720/50 HP machine as on
 712/60 of Niskanen
References: <3A4940BF.3EB18F61@dot.at> <20001227012741.A150937C97@carmen.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

What is a newer kernel  ?
Date, version ?
What does IIRC mean ?

Ad tool-chain:

        I use the tool-chain of the puffingroup, selfmade from the
        latest version of 21.12.2000 or so. I build it from source
        and it was no problem except the fact, that the it must be
        `--host' not `--HOST' (I have some experiences in it).

        But it was not possible to build bash from the scratch in
        this way. host=hppa-linux, build=i386-linux should be the
        correct one, but ....
        The biuld process of bash (and I think for other too,
        does not call the cross compiler). The use of CC= AS= LD=
        etc has the other problem, that binary tools which are build
        in the build process are running on PA RISC, but they are used
        in i386 for further building.

        So my question: How can I tell an autoconfigured build process
        (standard linux source tree) to use the cross compiler on the
        right points.

	As I used RedHat up to now, I have no experience in
	debian packaging system. What are this files like
	dpkg-cross tool, etc...
	How to use them, how to install them.

	You say, the bash is a problem. Is this for other tools
	much easier, like `init' or daemons, etc...

Thanks for the help and a happy new year soon....

	Christoph Plattner




Matt Taggart wrote:
> 
> Christoph Plattner writes...
> 
> > On my 9000/720 (I have it since one week) I have the same problem
> > booting the CD 0.5
> > or
> > a selfbuild kernel. The kernel boots, but on calling the
> > init a trap is called with the text:
> >
> > handle_interruption() pid=1 command='init'
> >
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001001111111100001011
> > r0-3     00000000 000c0f38 00033a1b 000c0f3c
> > r4-7     000c0f38 ffffffff 00000001 0002a1d8
> > r8-11    c02ac640 00000000 00000000 c0145f30
> > r12-15   00000000 00000000 00000000 00000000
> > r16-19   c027b60c 00000000 c02ac000
> >
> > and so on, running in a loop.
> 
> Yes, several people(myself included) saw this. IIRC a newer kernel fixes it.
> 
> > The code is in kernel/traps.c
> >
> > Further I tried to build a statically linked bash-2.03,
> > but I had problems setting up the build process to produce
> > a HP PARISC user program. What I have to do to setup or
> > prepare default source trees for cross building (the
> > compiler runs....)
> 
> Which compiler are you using? You can grab a prebuilt hppa cross-compiler
> (that runs on i386-linux) at,
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tar.gz
> 
> bash is particularly hard to build. I was able to get the debian package to
> cross compile using the dpkg-cross tool and by making a few changes to the
> source tree. I still need to test the binary, if it works I'll post it.
> 
> --
> Matt Taggart
> taggart@fc.hp.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
