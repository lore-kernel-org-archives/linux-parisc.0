Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA09606
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 18:31:28 -0700
Message-Id: <5.0.0.25.0.20001102172521.02ac5e40@mail.webcash.com>
Date: Thu, 02 Nov 2000 17:29:19 -0800
To: Matt Taggart <taggart@carmen.fc.hp.com>, parisc-linux@thepuffingroup.com
From: Kailashnath V Rampure <kailasr@webcash.com>
In-Reply-To: <20001031231609.8F44638554@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] Boot command
List-ID: <linux-parisc.vger.kernel.org>

Hi,
I have run the following command to initialize the sda harddisk. The sda3 
is the linux native partion.
Wen I say boot on the HP server  it is trying to boot from /stand/vmunix 
instead of vmlinux can any one help me about the command. Secondaly I want 
to knwo what is the term type as its not taking vt100 so I am unable to 
open vi.

I have made nesessary changes for the /etc/fstab

$ palo -I -k /boot/vmlinux -b /boot/iplboot -c '3/boot/vmlinux TERM=linux 
HOME=/ root=/dev/sda3' /dev/sda

regards
Kailas
