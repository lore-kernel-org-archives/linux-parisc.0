Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA07218
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 10:34:54 -0600
From: davisg@Celestica.com
Received: from hivermuet.advantis.ca (hivermuet [198.74.66.3]) by glace.qu.ca.prserv.net (AIX4.3/UCB 8.8.8/8.8.8) with ESMTP id MAA195146 for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 12:33:15 -0500
Received: from Celestica.com ([32.69.41.45]) by hivermuet.advantis.ca (AIX4.3/UCB 8.8.8/8.8.8) with ESMTP id MAA22210 for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 12:33:07 -0500
To: parisc-linux@thepuffingroup.com
cc: davisg@Celestica.com
Message-ID: <85256906.0058CF14.00@tormta3.tor.cel.com>
Date: Thu, 22 Jun 2000 12:03:01 -0400
Subject: Re: [parisc-linux] 735 and rboot
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



Oops, forgot to send this to the list.
---------------------- Forwarded by George G Davis/CCH/Celestica on 06/22/2000
12:00 PM ---------------------------


George G Davis
06/22/2000 11:57 AM

To:   Alexander Strauss <strauss@astracom.net>
cc:

Subject:  Re: [parisc-linux] 735 and rboot  (Document link: George G Davis)


The Model 735 does indeed still use rboot for booting via LAN and always will -
the rboot
protocol is embedded in the platform LAN IODC firmware. If you're using HP-UX
10.0 or
later as the LAN boot server, you can enable the rbootd server to handle boot
requests
from rboot clients. The HP-UX (10.0 or later) rbootd server converts the rboot
packets to
bootp and forwards them to the bootpd server.

I'm not aware of how to support rboot clients on non-HP-UX boot servers.

Regards,
George




Alexander Strauss <strauss@astracom.net> on 06/22/2000 03:05:23 AM

To:   Darcy Buskermolen <darcy@ok-connect.com>
cc:   parisc-linux@thepuffingroup.com (bcc: George G Davis/CCH/Celestica)

Subject:  Re: [parisc-linux] 735 and rboot



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

---------------------------------------------------------------------------
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
