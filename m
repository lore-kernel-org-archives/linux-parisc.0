Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-01.iinet.net.au [203.59.3.33])
	by dsl2.external.hp.com (Postfix) with SMTP id 30EB0482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 23:18:53 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id NAA31137
	for parisc-linux@lists.parisc-linux.org; Thu, 6 Sep 2001 13:18:40 +0800
Date: Thu, 6 Sep 2001 13:18:37 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs update gives 'move away ....' on every file
Message-ID: <20010906131834.X16220@neep.com.au>
References: <20010905152944.A23742@middle.of.nowhere> <200109060504.XAA09545@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109060504.XAA09545@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, Sep 05, 2001 at 11:04:24PM -0600
List-ID: <linux-parisc.vger.kernel.org>

Quoth Grant Grundler:
> You didn't name the CVS repository to use and cvs got confused.
> 
> Try 'cd /home/cvs/parisc/linux; cvs update -APd'
> Or  'cd /home/cvs/parisc; cvs update -APd linux'

... with "-d:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc"
in there too, or your current environment's $CVSROOT set accordingly.

The -q and -z3 flags are good too, to avoid unnecessary chatter and to
compress the data stream a bit.  Avoid the temptation to crank up to -z9
as this just puts the server on its back for minimal gain.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
