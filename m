Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA05246
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 Nov 1999 17:56:17 -0700
Message-Id: <199911200057.QAA23404@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] Today's boot experience on a 735
Date: Fri, 19 Nov 1999 16:57:59 -0800
From: Cary Coutant <cary@cup.hp.com>
To: "Philipp Rumpf" <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: "Jeff Law" <law@cygnus.com>, <bame@debian.fc.hp.com>,
        <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

Could someone explain to me what the real problem with the _end symbol 
is? I can't seem to extract the essence of the problem from all the mail 
that's flying by.

The SOM linker is supposed to create the symbol "_etext" at the end of 
the last text subspace, the symbol "_edata" at the end of the last 
initialized data subspace, and the symbol "_end" at the end of the last 
data subspace. It shouldn't matter what the name of the subspace is, or 
what its sort key is. Common symbols get allocated at the end of the last 
data subspace, and the "_end" symbol should be at the end of that. If 
something is being allocated by the linker after "_end", I'd like to 
understand why.

You should be able to use "_edata" and "_end" to figure out how much 
memory to initialize to zero at startup, or you could have the boot 
loader do that for you -- the information is in the a.out aux header.

By the way, the SOM linker does support "scripts" of a sort. They're 
called k-files (because you use the -k option to specify them), and they 
allow you to control the placement of your spaces and subspaces within 
the address space.

-cary
