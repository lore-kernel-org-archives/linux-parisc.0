Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA06254
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 09:24:12 -0600
Message-Id: <3.0.32.20000622082740.03e0cd30@mail.ok-connect.com>
Date: Thu, 22 Jun 2000 08:27:40 -0700
To: Alexander Strauss <strauss@astracom.net>
From: Darcy Buskermolen <darcy@ok-connect.com>
Subject: Re: [parisc-linux] 735 and rboot
Cc: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

My 735 uses rboot, I've confirmed this by using tcpdump and ethernet
protocol analysis tools, when I type boot lan.ether-adder.0.0 it is infact
doing a rboot and not tftp or bootp.





At 09:05 AM 6/22/00 +0200, you wrote:
>Darcy,
>
>the 735's are not using RBOOT anymore - they're using the standard BOOTP
>protocol. For more information, see the comments in any standard
>/etc/bootptab template or the bootp manual pages. A sample entry should
>look like this
>
><hostname>:\
>        :hd=<tftp-directory>:\
>        :bf=<bootfile>:\
>        :ht=ether:\
>        :ha=<mac-addr>:\
>        :sm=<subnet-mask>:\
>        :hn:\
>        :ip=<ip-address>:\
>        :vm=rfc1048:
>
>If bootpd and tftpd are ready, you can try to boot your HP with a "boot
>lan" command, also the BOOTP server should be visible when searching for
>bootable devices...
>
>Regards,
>Alex
>
>
>Darcy Buskermolen wrote:
>> 
>> Has anybody gotten pa-linux to boot via rboot ?
>> 
>> My old 735/125's only give me the rboot option  for booting from the
>> network (which I have never before used).
>> 
>> if someone has instructions for this that would be extreamly helpful
>> however, Any information would be useful
>> 
>> ---------------------------------------------------------------------------
>> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
>> `unsubscribe' as the subject.
>
>-- 
>best regards,
>Alexander Strauss <strauss@astracom.net>
>
>
