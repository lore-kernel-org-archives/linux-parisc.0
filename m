Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-02.iinet.net.au [203.59.24.17])
	by dsl2.external.hp.com (Postfix) with SMTP id DB3F8482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 21:12:39 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id LAA05369
	for parisc-linux@lists.parisc-linux.org; Thu, 12 Jul 2001 11:12:21 +0800
Date: Thu, 12 Jul 2001 11:12:15 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.92 install iso problems
Message-ID: <20010712111206.F17064@neep.com.au>
References: <002c01c10a40$ba3143a0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002c01c10a40$ba3143a0$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Wed, Jul 11, 2001 at 03:36:05PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Quoth rpengelly:
> I've downloaded and burned the 0.92 install iso but I run into trouble
> while retreiving packages. It can't retrieve groff and then quits
> because of it. Any suggestions?

In what way can it not retrieve groff?  Simply 'file not found'?  Run
'apt-get update' and try again.  Or give a bit more information about
your problem.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
