Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA01836
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 01:05:23 -0600
Sender: alex@mktg.tide.ti.com
Message-ID: <3951BAB3.F8FCC7AA@astracom.net>
Date: Thu, 22 Jun 2000 09:05:23 +0200
From: Alexander Strauss <strauss@astracom.net>
MIME-Version: 1.0
To: Darcy Buskermolen <darcy@ok-connect.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735 and rboot
References: <3.0.32.20000621165322.01cc8100@mail.ok-connect.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Darcy,

the 735's are not using RBOOT anymore - they're using the standard BOOTP
protocol. For more information, see the comments in any standard
/etc/bootptab template or the bootp manual pages. A sample entry should
look like this

<hostname>:\
        :hd=<tftp-directory>:\
        :bf=<bootfile>:\
        :ht=ether:\
        :ha=<mac-addr>:\
        :sm=<subnet-mask>:\
        :hn:\
        :ip=<ip-address>:\
        :vm=rfc1048:

If bootpd and tftpd are ready, you can try to boot your HP with a "boot
lan" command, also the BOOTP server should be visible when searching for
bootable devices...

Regards,
Alex


Darcy Buskermolen wrote:
> 
> Has anybody gotten pa-linux to boot via rboot ?
> 
> My old 735/125's only give me the rboot option  for booting from the
> network (which I have never before used).
> 
> if someone has instructions for this that would be extreamly helpful
> however, Any information would be useful
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
best regards,
Alexander Strauss <strauss@astracom.net>
