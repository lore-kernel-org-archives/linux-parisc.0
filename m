Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA08115
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Mar 2000 02:28:13 -0700
Message-ID: <000201bf8f21$bff17b70$a94abc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <Helge.Deller@ruhr-uni-bochum.de>, <ulrich_strelow@yahoo.com>,
        <parisc-linux@thepuffingroup.com>
References: <00031601070900.00312@P100>
Subject: Re: [parisc-linux] ramdisk problem with ELF kernel
Date: Thu, 16 Mar 2000 09:25:08 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> I just checked the hardware-database, and it seems that the 715/33 has a
> standard LASI-LAN-Adaptor (i82596, (old driver: Apricot)).
> If you enable lasi-support and the "lasi-ethernet"-driver from the
> network-devices, you should be able to boot with root-nfs.....

The problem is, that it has ASP not LASI. The MAC address is not returned
by the PDC call the current driver is using thus the driver gives up.

Gyula
