Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-02.iinet.net.au [203.59.24.17])
	by dsl2.external.hp.com (Postfix) with SMTP id EB576482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 23:57:20 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id NAA26560
	for parisc-linux@lists.parisc-linux.org; Fri, 20 Jul 2001 13:56:57 +0800
Date: Fri, 20 Jul 2001 13:56:46 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6-pa20 question about modules
Message-ID: <20010720135640.W23932@neep.com.au>
References: <OF46B79DB5.FE766246-ONC1256A8E.005BA756@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <OF46B79DB5.FE766246-ONC1256A8E.005BA756@LocalDomain>; from jso@europay.com on Thu, Jul 19, 2001 at 07:46:09PM +0200
List-ID: <linux-parisc.vger.kernel.org>

Quoth Joël Soete:
> Just a small tips I use on my i386 linux-box: I launch the make in one line
> and tacke a log which I can so analyze later like:
> 
> make dep clean bzImage modules modules_install 2>&1 | tee /var/tmp/kl-200107.log

Safer to run them separately.  You can still easily log them, there are
many possible ways to do this ...

$ for target in clean dep vmlinuz modules modules_install
> do make $target 2>&1 | tee -a /var/tmp/kl-200107.log
> done

$ (make clean ; make dep ; make vmlinux ; make modules ; make modules_install) 2>&1 | tee -a /var/tmp/kl-200107.log

$ script /var/tmp/kl-200107.log
Script started, output file is /var/tmp/kl-200107.log
$ make clean ; make dep ; make vmlinux ; make modules ; make modules_install ; exit
...
Script done, output file is /var/tmp/kl-200107.log
$


Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
