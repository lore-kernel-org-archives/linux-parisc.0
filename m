Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA21902
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 14:00:32 -0700
Message-Id: <5.0.0.25.0.20001031125250.00ad6430@mail.webcash.com>
Date: Tue, 31 Oct 2000 12:58:41 -0800
To: Paul Bame <bame@noam.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] unable to run palo on nfs root 
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <E13qeg4-0007kf-00@noam.fc.hp.com>
References: <Your message of "Mon, 30 Oct 2000 13:51:00 PST." <5.0.0.25.0.20001030134804.00a46a60@mail.webcash.com>
 <5.0.0.25.0.20001030134804.00a46a60@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul,

After booting the Server from NFSroot I need to Initialize the harddisk on 
the server. so I copied the palo and linux in to the nfsroot. I am trying 
to Run the following command:
$ palo -I -k /boot/vmlinux -b /boot/iplboot   -c '2/boot/vmlinux TERM=linux 
HOME=/ root=/dev/sda2' /dev/sda
fisrt partition is 10M of type f0
second partition is /dev/sda2 of type linux native.
Third partition is /dev/sda3 of type linux Swap

Then I get the cannot execute binary file.

second question is that what is the Terminal type I should set as I am 
unable to open vi.

Please suggest the correct steps.
Thanks.
Kailas



At 09:54 AM 10/31/00 -0700, Paul Bame wrote:
>= Hi,
>=
>= I have booted HP A class server from nfsroot. but when I try to run palo on
>= the server to initialize boot loader to the hdd I get
>= "cannot execute the binary file"
>=
>= can any one help me to make the hdd bootable
>
>It would help me to see the actual command you used and the actual
>error message(s) printed.  With the info you give so far it could be
>"a million" things.
>
>         -P
