Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA22717
	for <parisc-linux@puffin.external.hp.com>; Thu, 31 Aug 2000 13:21:07 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 31 Aug 2000 19:21:12 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13UZtU-0000c6-00; Thu, 31 Aug 2000 20:21:00 +0100
Date: Thu, 31 Aug 2000 20:21:00 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: "Albert E. Whale" <aewhale@hky.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: HP PA-RISC support
Message-ID: <20000831202100.A1078@parcelfarce.linux.theplanet.co.uk>
References: <39AE587E.E5EBE37A@hky.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39AE587E.E5EBE37A@hky.com>; from aewhale@hky.com on Thu, Aug 31, 2000 at 09:07:10AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 31, 2000 at 09:07:10AM -0400, Albert E. Whale wrote:
> Matthew,
> 
> You may remeber me contacting you some time again regarding the D200
> Class Server I have at a customer Site.
> 
> I am interested in installint Linux on the Server.  Is this platform
> supportted? Is there a distribution for it?  If not, can I help promote
> and or Beta test the environment to gain acceptance?

Hi, Albert.

I'm just about to leave on holiday for a month, so you're lucky you
caught me :-)  Linux does indeed boot on the D200, and the Alpha release
CD which is on the ftp site will run.  I'm not sure which devices will
be supported by that kernel, but it should be able to bring you to a
shell prompt.  The port is still a couple of months away from being
stable, so it's not really suitable for installing at a customer site yet.

-- 
Revolutions do not require corporate support.
