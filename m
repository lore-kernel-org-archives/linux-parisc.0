Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA23555
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Mar 2000 07:02:33 -0700
From: dkennedy@linuxcare.com
Date: Tue, 28 Mar 2000 10:13:27 -0500 (EST)
To: willy@thepuffingroup.com
cc: Mike Brancato <funnyguy@digitalsmackdown.net>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] build errors, recipe still not up to date?
In-Reply-To: <20000327184025.C31396@thepuffingroup.com>
Message-ID: <Pine.LNX.4.10.10003281011220.2131-100000@grasshopper.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 27 Mar 2000 willy@thepuffingroup.com wrote:

> Linux NFS Root looks for /tftpboot/<ip-address> by default.  I think
> there's a way to change it, but I forget how.

If you are DHCPing the Linux box, you can specify the NFS Root
directory as an option in the DHCP file.  Also, the (regular) Linux
kernel takes a command line argument which is the NFS Root directory.

-- 
David Kennedy, Senior Linux Consultant, Linuxcare, Inc.
613.562.9594 tel, 613.562.9304 fax
dkennedy@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
