Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA18601
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 14:18:43 -0700
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: dave@hiauly1.hia.nrc.ca (John David Anglin),
        alan@linuxcare.com.au (Alan Modra), marteaut@esiee.fr,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Include trouble 
In-Reply-To: Your message of "Tue, 28 Nov 2000 20:02:26 GMT."
             <E140qxQ-0004wV-00@the-village.bc.nu>
References: <E140qxQ-0004wV-00@the-village.bc.nu> 
Date: Tue, 28 Nov 2000 14:21:05 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E140sBV-0005ao-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= Go 32bit. Linus will probably refuse to touch a 32bit port using longlong
= internally for off-t

Hmmm, too bad, since we have few palinux backwards compatibility issues and
could just have the __USE_FILE_OFFSET64 glibc magic be a no-op rather
than supporting all those extra *64 syscalls.  Plus we'd need
considerably fewer syscall translators to run 32-bit apps on 64-bit
kernel (but might need more for 32-bit hpux apps).  It seems illogical
to make a file-system-related data type different based on cpu
word size but I understand this isn't simple -- oh well.

Seems like the consensus is 32-bit off_t on 32-bit kernel and just
live with all those *64 syscalls -- many not supported on palinux
yet I notice.

	-P
