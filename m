Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA22537
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 14:24:26 -0700
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] NEW NATIVE PALO TARBALL - REQUIRED
In-Reply-To: Your message of "Tue, 31 Oct 2000 12:58:41 PST."
             <5.0.0.25.0.20001031125250.00ad6430@mail.webcash.com>
References: <Your message of "Mon, 30 Oct 2000 13:51:00 PST." <5.0.0.25.0.20001030134804.00a46a60@mail.webcash.com> <5.0.0.25.0.20001030134804.00a46a60@mail.webcash.com>  <5.0.0.25.0.20001031125250.00ad6430@mail.webcash.com> 
Date: Tue, 31 Oct 2000 14:26:00 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13qiuu-00005u-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= Hi Paul,
= 
= After booting the Server from NFSroot I need to Initialize the harddisk on 
= the server. so I copied the palo and linux in to the nfsroot. I am trying 
= to Run the following command:
= $ palo -I -k /boot/vmlinux -b /boot/iplboot   -c '2/boot/vmlinux TERM=linux 
= HOME=/ root=/dev/sda2' /dev/sda
= fisrt partition is 10M of type f0
= second partition is /dev/sda2 of type linux native.
= Third partition is /dev/sda3 of type linux Swap

That looks great.

= Then I get the cannot execute binary file.

Ok I think we changed the kernal such that the old palo bits won't run
any more (we removed the old gateway page).  I uploaded a new version:
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/palo-200001031.tgz

	-P
