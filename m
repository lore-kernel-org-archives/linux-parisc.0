Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA16337
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Aug 2000 06:34:35 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 28 Aug 2000 12:34:36 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 28 Aug 2000 12:34:32 -0000
Date: Mon, 28 Aug 2000 07:29:36 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Erik Paulson <epaulson@upl.cs.wisc.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] FW Scsi support?
Message-ID: <20000828072936.U29677@vodka.thepuffingroup.com>
References: <20000827165229.A18560@data.upl.cs.wisc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000827165229.A18560@data.upl.cs.wisc.edu>; from Erik Paulson on Sun, Aug 27, 2000 at 04:52:29PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Aug 27, 2000 at 04:52:29PM -0500, Erik Paulson wrote:
> Hi
> 	I'm trying to get my C100 and C160 to boot with the CD image. Everything
> seems fine, except they don't see the SCSI disk I've got - only the CDROM.
> 
> My guess is that they're angry about it being on the FWSCSI, (my CDROM is
> on SESCSI)
> 
> Is Fastwide SCSI supported? If not, what needs to be done? I didn't see how
> to turn it on with 'make config'. Are there docs availble for this hardware?

You need to enable Zalon support.  Not sure where that is in the config
section.

-- 
Revolutions do not require corporate support.
