Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA28912
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 04:53:28 -0700
Sender: phi@hpfrcu81.france.hp.com
Message-ID: <383145A5.C2AF5857@hpfrcu03.france.hp.com>
Date: Tue, 16 Nov 1999 12:53:09 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: frowand@cup.hp.com, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com, adevries@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <E11nhb8-0002Zh-00@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> 
> Thats why someone pulled that number out of a hat. You can pull any other
> page aligned number out of a hat and that will be fine too.
> 

Hum interesting, too bad the hat didn't got 0x1000 or 0x10000 i.e something
that could be mapped to 0.0x0x1000 or 0.0x10000 this would greatly simplify
the kernel code writing that need to run traslation off, I bet they used a red
hat :-)

> 
> Alan

Anyway I'm sure that after a significant effort and marco's vmlinux will
finally boot with all those funny things, 2 os in 1 file etc... :-) 

I'm still in the dark regarding spaces usage (that is hppa dependent) in
vmlinux, since this define the VAS usage, I'm back to the initial question how
the VAS is used/designed for the kernel and for user processes.

For instance how big can be a process under linux on pa1.1?

If you answer is lnear 4Gb,  I would say whoa they must have a real good
design.
If you say 4x1Gb, I would say hum, they are using spaces
If you say nx1Gb, I would say, looks interesting, they must have compiler
support for long pointer

Etc....

For now I have the feeling (hoping I completly wrong) that the user space is
confined into the low 2Gb and the kernel space is located into the high 2Gb,
well I bet I'm wrong here, I will try to find this mm.c code you spoke about,
I was more hoping de design document even very thin, there is no need for a
big book to describe how a VAS is implemented.


Phi
