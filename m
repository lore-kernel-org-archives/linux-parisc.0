Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-03.iinet.net.au [203.59.24.18])
	by dsl2.external.hp.com (Postfix) with SMTP id 37614482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 09:58:16 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id XAA17154
	for parisc-linux@lists.parisc-linux.org; Thu, 12 Jul 2001 23:57:56 +0800
Date: Thu, 12 Jul 2001 23:57:52 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems with checksums
Message-ID: <20010712235750.Q17064@neep.com.au>
References: <001201c10ad2$3beb97b0$0f809b8e@ati.stlawrencec.on.ca> <20010712140756.C18375@linuxcare.com> <001e01c10ad6$588cb4e0$0f809b8e@ati.stlawrencec.on.ca> <20010712145615.E18375@linuxcare.com> <000701c10ae4$186cf6a0$0f809b8e@ati.stlawrencec.on.ca> <20010712082908.K531@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010712082908.K531@tausq.org>; from randolph@tausq.org on Thu, Jul 12, 2001 at 08:29:09AM -0700
List-ID: <linux-parisc.vger.kernel.org>

Quoth Randolph Chung:
> Be careful, Debian uses BSD md5sum instead of GNU md5, some other
> Linux systems use GNU md5sum. They produce different output for the
> same input!

It does?  I've never seen a GNU md5sum.  BSD's "md5" program has a
different output format although the algorithm is the same.  Also the
various checksum programs I've found for Windows and Mac OS refer to the
algorithm as 'RSA MD5'.  The only times I've found a discrepancy between
md5sum programs is the Windows command-line one that rudely assumes data
is ascii by default and has to be given the '-b' flag for checksums to
match those generated under a Unix or Mac.

(If you can set me straight off-list I'd be happy to listen.)

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
