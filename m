Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA30083
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 05:43:18 -0700
Date: Tue, 16 Nov 1999 13:35:59 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Philippe Benard <phi@hpfrcu03.france.hp.com>
Cc: frowand@cup.hp.com,
        Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
Message-ID: <19991116133559.Z25252@mencheca.ch.genedata.com>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <38311538.30826FC7@hpfrcu03.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38311538.30826FC7@hpfrcu03.france.hp.com>; from Philippe Benard on Tue, Nov 16, 1999 at 09:26:32AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 16, 1999 at 09:26:32AM +0100, Philippe Benard wrote:
> Sounds like linux is not more portable than any other propriaitary OS since
> confined to PC architecture, a port beeing a mimic of PC if the target arch
> can do it.

I think Linux is actually more ported than *BSD these days...

> As i said in a previous mail we have two choice here, mimic closely the PC up
> to the endianism for instance, to be able to grab as much stuff as possible
> from the PC world but ultimatly we will not be able to run PC-linux
> executable, then being that close doesn't looks that important. On the other
> hand being as close as HPUX (and HP dependend stuff like PDC) could allow to
> be able to dual boot vmunix/vmlinux, to run hpux a.out onto vmlinux to
> laverage current hp software (if any) etc... being close to hp design is
> somewhat having the kernel in low phys addr.

The sash executable we have been using as our only piece of userspace
runs under HPUX using HPUX syscalls.  It will make no difference to
userspace where the kernel is mapped.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
