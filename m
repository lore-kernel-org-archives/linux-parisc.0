Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (unknown [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90B114829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jun 2003 04:11:23 -0600 (MDT)
Date: Mon, 2 Jun 2003 12:11:15 +0200
Message-ID: <3ED70CF100000B3C@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] compiler & kernel
To: "M. Grabert" <xam@cs.ucc.ie>,
	"Joel Soete" <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Max,

>
>On Sat, 31 May 2003, Joel Soete wrote:

> M. Grabert wrote:
>
> >[...]
> >
> >Oh yes, one important issue:
> >I have this 'target suffers from tag starvation' problem as some others
> >seem to have aswell. I just have a 20GB SE
SCSI (50 pin), n
> other SCSI
> >devices (the original internal UW-SCSI drive is in my AlphaStation now).
> > [...]
>
> Which scsi driver do you used (I presume a Symbios one but version 1 or
> 2; version 2 is recommended now in 2.4.20-pa..)?


 have/had this pro
>lems with both (old/new) Symbios drivers!
The problems are fixed for any Symbios driver when I use an older version
of 53x700 driver. I did extensive testing (for kernel with driver version
1 and 2) for 2 days before I was convi
ed that this 'fix' a
>tually works.

Right now the kernel I currently use (with the longest uptime for months
so far) is using the Symbios v1 driver, but as I said v2 works now aswell!

Curious, last v2 I do not have any more pb (neither on b180 
or b2k, N).
(that doesn't mean that I don't trust you; just share info)

I just install a 36Gb lvd disk on my b2k (ST336704LC HP supply) on the built
in scsi-controler which is of model <895a>(,rev 0x1) and all seems to works
fine.

> OTC this w
e I still experiment such a scsi terminator pb: I recover a
> lvd 30g
> scsi-disk (sun); I find a converter sca2 80pins sca 64pins but
> a cable with terminator for hvd disk. The disk seems to works fine
> untill the terminator warm to much then I 
ot scsi parity errors. And
> without terminator the controler do not se
> the disk at all?

That's actually the first time that I hear of a SCSI terminator
overheating. Perhaps you shouldn't overclock your SCSI bus then ;))))

But seriously, I h
ve had lots of troubles with 80pins to 64pins
converters and UW to U-SCSI
>converters. Quite often they didn't work
for some harddisk and others worked fine. I don't trust these converters!

Hmm to say everything: the converter came from a interna
 UW-disk of a k360,
the cable and its terminator from a D380 and nothing was foreseen for new
lvd :(.
(but that was just a do-it-yourself test because no shop of scsi spare part
near home :O )

> >hppa64-gcc (3.2.3, from ftp.p-l.org unofficial-de
s)
> >  seems to work fine but obviously ipt_limit.o is miscompiled:
> >  I ca
> insmod it, but iptable wouldn't recognize the --limit* options.
> >  There are still some problems with some modules and canonicalize_funcptr,
> >
> Are you sure thi
 is with hppa64-gcc (iirc canonicalize.., was just
> recently backport to 3.2)?

>
> [...]

I thought so. The canonicalize_* stuff showed up when compiling with
gcc-3.3 (I forgot this to mention), but I thought they showed up in
3.2 (64bit). Ma
be I just can't remeber this one correctly.
But the iptable_limit error is definite
>y a hppa64-gcc-3.2.3 issue
(or a kernel issue with hppa64 ;)

Well gcc-hppa64 pkg is a bit out dated but that is all is available.
And I do not found courage to 
oolchain the last gcc-3.3 :(

>
> >  Man, gcc-3.3 is SLOW! it takes ages to compile the kernel!
> >
> >  Kernel compiled with 3.3 definitely have a bogomips problem (they report
> >  0.8 instead of about 470 on a C2
>0);

This might actually b
 PA8000 specific ...

> >  The kernel takes forever to boot up (it 'waits' for over one minute
> >  after palo loads the kernel (right after the 'switch to another console'
> >  message)), propably because of the bogomi
>s calculation.

...my PA
book with the same kernel & gcc-3.3 doesn't hang!

> >  Also the userspace programme 'bogomips' has the same issue.
> >

Sorry could not help (no clue of what bogomips is: just see on my i386 but
no trace in my hppa dmesg?)

> >  Apart to make 
rom this issues, gcc-3.3 produces a kernel that is at
> >  least as stable as th
>se compiled with 3.0 or 3.2

I'll send the config file as soon as I'm back home (tomorrow)

No problem (I curoius to compare on the hw I test here)

> btw which g
c-3.3 release do you use?

the latest in testing (no prerelease anymore)

Well I used last unstable, let see


Joel




---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
