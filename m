Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA21309
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Oct 2000 07:14:35 -0600
Sender: vidal@hpfrcu03.france.hp.com
Message-ID: <39DB2C2D.BBFBAA18@admin.france.hp.com>
Date: Wed, 04 Oct 2000 15:10:05 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: yuqian <yuqian@huawei.com>
Cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] pre-build HP-UX/10.20 bash's problem
References: <20001004125746.18672.qmail@mailserv2.iuinc.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

	Hi
The answer is in your kernel. Rebuild the hpux kernel
after modifying the parameter:
ncargs_enable = 1
(I don't remember exactly the parameter name but it
must be this one). It will let you access 24kb for
arg list, without this modification the size for
arg is only 2k. This parameter is adding by PHKL_16751.

	Bye.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
