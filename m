Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA22983
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 00:35:33 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com, Paul Bame <bame@debian.fc.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hack to use HPUX boot loader
Date: Thu, 28 Oct 1999 00:02:07 +0200
Content-Type: text/plain
Cc: parisc-linux@thepuffingroup.com
References: <199910271811.MAA17359@debian.fc.hp.com>
MIME-Version: 1.0
Message-Id: <99102800052200.00292@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Wed, 27 Oct 1999 schrieb Paul Bame:
> = 
> = Has anyone confirmed that the kernel which is started is getting good
> = data (stack, etc...) or are my kernels booting purely by accident?
> = 
> 
> Phillip looked over some boot messages after being booted with the
> hpux boot loader and blessed them, so things appear to be working well.
> 
> How about a COMMAND LINE?
> 
> If anyone wants to investigate a bit and work on head.S, it looks like
> when launched from the current hpux boot loader that the args
> passed to the kernel are
> 
> 	int argc, char *argv[], char *envp[],
> 
> with some slightly bizzare stuff in the "environment", of possible
> interest:
> 
> 	env[2] - load address *of the boot loader itself*
> 	env[3] - size *of the boot loader itself*
> 
> argc will always be a low number >= 1.  If you had told ISL:
> 
> 	ISL> hpux /boot/vmlinux a b c
> 
> then argc would supposedly be 4 and argv[2], for example, would be "b".
> I suspect the argv[] should be copied to somewhere safe.
> 
> Note that this is very different from the statment in head.S:
> 



>          *      %arg3(=%r23) holds HALF(!) of the size of the BSS-Segment

!!!! Please, don´t expect the above line to be valid at all !!!!!!!!!
It was just one of my bad investigations and seemed to be true in my
stupid tests. As already said in other mails: It´s hard without any
documentation !
(If someone want, please delete it from the source !!)

Helge.


> 
> 			    -Paul Bame
> 
