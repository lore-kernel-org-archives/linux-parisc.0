Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA14863
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 07:06:19 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A266BE1.5DA1C812@uswest.net>
Date: Thu, 30 Nov 2000 07:01:53 -0800
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: "Jorge L. deLyra" <delyra@latt.if.usp.br>
CC: Steve Moret <smoret@uci.edu>, parisc-linux@thepuffingroup.com,
        assirati@socrates.if.usp.br
Subject: Re: [parisc-linux] HP 9000/735-125
References: <Pine.LNX.3.96.1001130085854.14082C-100000@latt.if.usp.br>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Jorge L. deLyra" wrote:

> > I have a 735-125 and am able to net-boot it on a custom configured kernel as
> > long as I disable the ASP parallel ports. It works quite well using an NFS
> > root as I cannot get the SCSI hard drives to mkfs. I was going to try and
> > debug it but have yet to find the free time. I can e-mail you my working
> > .config for the kernel, or build kernels (tested on my own 735) for people
> > if they need them.
>
> Well, looks like the problem is known, good! But we have a queer little
> problem with our machines here, we are unable to boot from the network. I
> think we did everything right, in fact, we are trying to use a server here
> other machines boot from, it has dhcp, boopt, tftp, rarp, the works. We
> set it all up, put the kernel on the tftpboot area, tested all that we
> could by other means but, when we try to net boot the HPs, we are faced
> with complete silence on the network. No logs on the server, nothing.
>
> A little explanation might be needed: these are not really native 735-125
> models, they were upgraded from older 720-50 models by card swapping. I am
> not sure whether all cards were changed, maybe some aspects of the machine
> are still old. The syntax of the net boot procedure in them is strange,
> you have to put in the hardware address of the server, which is unusual.
>
> I _suspect_ that this bios does not use tcp/ip for the net boot, but some
> HP proprietary protocol relating to that clustering software they have or
> used to have for these machines, in which you ran several stations out of
> the disks of a single one. In any case, a listing of what happens on the
> console on a net-boot trial goes below. We had a tail -f on the system log
> of the server, we had tcpdump listening, but nothing at all shows up...

I believe the 735/755 type machines require rbootd to boot from the network.
rbootd is available at:

ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/rbootd-2.0-2.tar.gz

- Ryan
