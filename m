Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA03512
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 02:39:37 -0700
Date: Mon, 22 Nov 1999 10:40:54 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Cary Coutant <cary@cup.hp.com>,
        Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        law@cygnus.com, bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Today's boot experience on a 735
Message-Id: <19991122104054.D1310@mathe.stud.uni-erlangen.de>
References: <199911200057.QAA23404@adlmail.cup.hp.com> <199911201840.NAA01911@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911201840.NAA01911@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> > You should be able to use "_edata" and "_end" to figure out how much 
> > memory to initialize to zero at startup, or you could have the boot 
> > loader do that for you -- the information is in the a.out aux header.
> 
> I haven't verified this myself but I believe others have determined
> that the kernel needs to clear unitialized data itself because of the
> various different way it is loaded.

The problem is we need to know where free memory starts for our memory
allocator - who does the BSS clearing is another issue.

> > By the way, the SOM linker does support "scripts" of a sort. They're 
> > called k-files (because you use the -k option to specify them), and they 
> > allow you to control the placement of your spaces and subspaces within 
> > the address space.
> 
> That's good to know and it might provide a better way for the kernel to
> determine its end.

Is anyone reasonably fluent in whatever language ld uses ?

	Philipp Rumpf
