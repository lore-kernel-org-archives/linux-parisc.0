Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (i003-034.nv.iinet.net.au [203.59.3.34])
	by dsl2.external.hp.com (Postfix) with SMTP id 27126482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 04:52:17 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id SAA27285
	for parisc-linux@lists.parisc-linux.org; Fri, 3 Aug 2001 18:52:12 +0800
Date: Fri, 3 Aug 2001 18:52:09 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] dev-packages
Message-ID: <20010803185207.S5850@neep.com.au>
References: <20010803113539.B1011@linuxcare.com> <Pine.BSF.4.30.0108031237250.38503-100000@noc.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.30.0108031237250.38503-100000@noc.zabbadoz.net>; from bzeeb+hplinux@zabbadoz.net on Fri, Aug 03, 2001 at 12:38:16PM +0200
List-ID: <linux-parisc.vger.kernel.org>

Quoth Bjoern A. Zeeb:
> That's it. thanks.
> 
> Is apt proxy-aware ?

man 5 apt.conf

=)

It sure is, add something like this in your /etc/apt/apt.conf:


// Options for the downloading routines
Acquire
{
  
  // HTTP method configuration
  http 
  {
    Proxy "http://proxy.internal.neep.com.au:3128/";
  };
};


apt-get will also obey the $http_proxy environment variable.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
