Return-Path: <hppa-linux@puffingroup.com>
Date: Fri, 19 Feb 1999 02:15:37 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] egcs and binutils cross compiling
In-Reply-To: <199902181540.HAA05282@gatekeeper.equator.com>
Message-ID: <Pine.LNX.3.96.990219020153.6493S-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"TO1LT.0.gE7.a1Hps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


On Thu, 18 Feb 1999, Jason Eckhardt wrote:
>  I think most of you are using Mklinux as the crosscompiler host. Has
>  anyone tried building the cross compiler from HP-UX? This will probably
>  have to be my build system since Mklinux doesn't work for me.
>  jason.

My primary non-native build environment for the forseeable future is my
PII 400 (i386 family) running Red Hat Linux, for which these packages were
intended. That may change. 

Well, I'm certainly not against having hpux based cross compilers, and
they shouldn't be that difficult to do. I might have a look at it myself,
although I'm not sure if the 735 I have has CC or gcc on it.

Certainly, though, I'd entertain distributing binaries for cross compiling
egcs and binutils with host=hppa1.1-hp-hpux target=hppa1.1-hp-linux.  All
the parts are there. 

Normally I'd say that it's easy to build it yourself, but building cross
compilers tends to be a real pain.

Also, Paul is changing the ELF header structure significantly between
mklinux and *real* linux, so we're getting close to having to just abandon
all of mklinux.

- Alex

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
