Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17732482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:44:52 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15sQ1x-0008MD-00
	for parisc-linux@lists.parisc-linux.org; Sat, 13 Oct 2001 16:44:49 +0200
Date: Sat, 13 Oct 2001 16:44:48 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
Message-ID: <20011013164448.A4317@dogbert.localdomain>
References: <20011013162103.A3604@dogbert.localdomain> <20011013162718.B3604@dogbert.localdomain> <3BC851AB.7968C3D5@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BC851AB.7968C3D5@esiee.fr>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

Hello,

Are you saying disabling the STI console will make the SCSI driver work?
I just mentioned the STI console because I seem to recall Matthew Wilcox
checked in some patches for it since I last tested...?

So, do you still want me to test?

Cheerio,

Albert

On Sat, 13 Oct 2001, Thomas Marteau wrote:

> Hi Albert,
> 
> 	Could try a kernel where you do not select STI console and Generic STI
> frame buffer device support in Console drivers section. To see if it
> does the same thing. If it works I think it could be useful to post to
> the list the solution b/c I think there is a bug somewhere!
> 
> Thomas.
