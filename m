Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA09940
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 18:37:44 -0700
Message-Id: <200011030144.RAA29455@milano.cup.hp.com>
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot command 
In-reply-to: Your message of "Thu, 02 Nov 2000 17:29:19 PST."
             <5.0.0.25.0.20001102172521.02ac5e40@mail.webcash.com>
Date: Thu, 02 Nov 2000 17:44:23 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Kailashnath V Rampure wrote:
> Hi,
> I have run the following command to initialize the sda harddisk. The sda3 
> is the linux native partion.
> Wen I say boot on the HP server  it is trying to boot from /stand/vmunix 
> instead of vmlinux can any one help me about the command.

Sounds like your system is booting from an existing HPUX installed disk.
Ie you are not using palo.

> Secondaly I want 
> to knwo what is the term type as its not taking vt100 so I am unable to 
> open vi.

TERM=linux is what I've seen before.
The debian ncurses package might need to be installed first though
and vt100 should work too.

Search the mail archive at
	http://puffin.external.hp.com/cgi-bin/mailgrep

grant

> 
> I have made nesessary changes for the /etc/fstab
> 
> $ palo -I -k /boot/vmlinux -b /boot/iplboot -c '3/boot/vmlinux TERM=linux 
> HOME=/ root=/dev/sda3' /dev/sda
> 
> regards
> Kailas
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
