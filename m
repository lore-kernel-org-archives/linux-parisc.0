Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA15123
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 13:32:42 -0700
Message-Id: <5.0.0.25.0.20001101122543.02a49370@mail.webcash.com>
Date: Wed, 01 Nov 2000 12:30:40 -0800
To: Paul Bame <bame@noam.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] NEW NATIVE PALO TARBALL - REQUIRED
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <E13qiuu-00005u-00@noam.fc.hp.com>
References: <Your message of "Tue, 31 Oct 2000 12:58:41 PST." <5.0.0.25.0.20001031125250.00ad6430@mail.webcash.com>
 <Your message of "Mon, 30 Oct 2000 13:51:00 PST." <5.0.0.25.0.20001030134804.00a46a60@mail.webcash.com>
 <5.0.0.25.0.20001030134804.00a46a60@mail.webcash.com>
 <5.0.0.25.0.20001031125250.00ad6430@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Thanks paul I was able to run the command.

Can you let me know what I should type at ISL prompt as its trying to boot 
from /stand/vmunix instead of /boot/vmlinux. Also I am unable to open vi as 
it says vi:LINUX:unknown terminal type.

Please suggest.
Regards

At 02:26 PM 10/31/00 -0700, Paul Bame wrote:
>= Hi Paul,
>=
>= After booting the Server from NFSroot I need to Initialize the harddisk on
>= the server. so I copied the palo and linux in to the nfsroot. I am trying
>= to Run the following command:
>= $ palo -I -k /boot/vmlinux -b /boot/iplboot   -c '2/boot/vmlinux TERM=linux
>= HOME=/ root=/dev/sda2' /dev/sda
>= fisrt partition is 10M of type f0
>= second partition is /dev/sda2 of type linux native.
>= Third partition is /dev/sda3 of type linux Swap
>
>That looks great.
>
>= Then I get the cannot execute binary file.
>
>Ok I think we changed the kernal such that the old palo bits won't run
>any more (we removed the old gateway page).  I uploaded a new version:
>ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/palo-200001031.tgz
>
>         -P
