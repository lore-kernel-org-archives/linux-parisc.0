Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA07657
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 19:08:19 -0600
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Make palo problem 
In-Reply-To: Message from Kailashnath V Rampure <kailasr@webcash.com>
   of "Thu, 26 Oct 2000 17:58:03 PDT." <5.0.0.25.0.20001026163140.00aed760@mail.webcash.com>
References: <5.0.0.25.0.20001026163140.00aed760@mail.webcash.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 26 Oct 2000 19:11:18 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001027011118.1CA6138137@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Kailashnath V Rampure writes...

>     * I have down loaded the latest prebuilt cross-compiler  and untared it 
> the a directory by name DEST

For that tarball, you need to untar in / which will put the compiler tree in 
/opt/palinux. If it's not there the compiler will not be able to find it's 
resources. Is that what you did?

I will update the web page to make this more clear.

HTH,

-- 
Matt Taggart
taggart@fc.hp.com
