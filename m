Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA05146
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 15:04:51 -0600
Sender: "Matthew Earley" <mearley@nortelnetworks.com>
Message-ID: <3773E943.F0ACB652@americasm01.nt.com>
Date: Fri, 25 Jun 1999 16:40:35 -0400
From: "Matthew Earley" <mearley@nortelnetworks.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting from CD...
References: <3773E26E.164B31F5@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> How do PA RISC machines manage booting from CD?  How does one create
> such a CD?

I am doing that as I read your post.  The Ignite-UX toolkit available on
software.hp.com has the tools to do this.  See make_medialif.  I make a
HFS file images that have Ignite golden images and SD software depots.
make_medialif creates the LIF file with the INSTALL boot and Ignite
config stuff. The instl_combine command wraps the LIF file containing
the INSTLALL kernel and INSTALLFS filesystem around my HFS image file. I
then use cdrecord to write the whole enchilada to CD-R.   

Matt
--
Matt Earley  nortelnetworks.com
