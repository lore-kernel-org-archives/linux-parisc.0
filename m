Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA07313
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jul 2000 01:30:32 -0600
Received: from ottawa.linuxcare.com (HELO localhost.localdomain) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 5 Jul 2000 07:31:52 -0000
Date: Wed, 5 Jul 2000 02:26:31 -0400
From: willy@thepuffingroup.com
To: Patric Karlstrom <PATRIC_KARLSTROM@HP-Sweden-om1.om.hp.com>
Cc: bame@riverrock.org, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
Message-ID: <20000705022631.T12436@vodka.thepuffingroup.com>
References: <m139fO9-001VsoC@chalet> <3962D90D.FCD2C15E@valhall.sweden.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3962D90D.FCD2C15E@valhall.sweden.hp.com>; from Patric Karlstrom on Wed, Jul 05, 2000 at 08:43:25AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 05, 2000 at 08:43:25AM +0200, Patric Karlstrom wrote:
> 
> Hello,
> 
> Just wanted to check if there exists a bootfloppy? I have a 715 without
> a harddrive and i want to be able to boot and then mount my rootfilesystem
> with nfs.

that already works fine.  edit the palo makefile to specify your NFS server
and you're away.

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
