Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-01.iinet.net.au [203.59.24.16])
	by dsl2.external.hp.com (Postfix) with SMTP id 3A2D8482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Apr 2001 20:25:49 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id KAA11592
	for parisc-linux@lists.parisc-linux.org; Mon, 30 Apr 2001 10:25:31 +0800
Date: Mon, 30 Apr 2001 10:25:27 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Keyboard driver patch proposal
Message-ID: <20010430102520.D15328@neep.com.au>
References: <3AEA4E6E.A990140B@esiee.net> <200104290624.AAA21764@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200104290624.AAA21764@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Sun, Apr 29, 2001 at 12:24:49AM -0600
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler said:
> BTW, I'm told the '//' comment style is not ok;  "/* ... */" is expected.
> It's not mentioned in Documentation/CodingStyle so I can't explain it.

Not all C compilers like C++ comments.  =(  It should be in the
CodingStyle document.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
