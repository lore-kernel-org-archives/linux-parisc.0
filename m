Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beldar.com (ns.beldar.com [65.163.106.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 198F9482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Nov 2001 18:02:25 -0700 (MST)
Message-ID: <006901c16ca9$78c16e60$0101a8c0@pogo>
From: "Craig D. Lansing" <lansing@beldar.com>
To: <raffo@neuronet.pitt.edu>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <2451.011113@nikom.tagil.ru> <3BF0C5D6.2040205@verizon.net>
Subject: Re: [parisc-linux] Problems of instaling (booting) on a 715/75
Date: Tue, 13 Nov 2001 20:12:43 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I'll try this with my J also to see what happens.  Unfortunately, despite
all the "junk" I brought home, the 700/92 has no keyboard (duh) and I could
not scrounge one today.  Oh well, back to the trash tomorrow.  BTW, if I can
scrounge a DB9<-->DB9 can I use a Reflection connection on my laptop as a
console?  I assume 9600/8/none/1 would be a good place to start?


----- Original Message -----
From: Rafael Herrera <vze26vn8@verizon.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Tuesday, November 13, 2001 2:03 AM
Subject: Re: [parisc-linux] Problems of instaling (booting) on a 715/75


> I'd suggest you boot the cd image (palinux-0.9.2.iso) using the serial
> console. I have the same system and the STI console does not work with
> that cd.
>
> As soon as you have a minimal system running, switch the kernel image in
> /boot for this one:
>
> ftp://ftp.parisc-linux.org/kernels/vmlinux-32-20011008
>
> Edit the /etc/palo.conf accordingly, re-run palo and reboot. I
> experienced scsi problems with the kernel in the cd image.
> --
>       Rafael
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
