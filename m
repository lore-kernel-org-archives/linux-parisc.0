Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-06.iinet.net.au [203.59.3.38])
	by dsl2.external.hp.com (Postfix) with SMTP id 91F7E482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Oct 2001 15:03:36 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id FAA10546
	for parisc-linux@lists.parisc-linux.org; Thu, 18 Oct 2001 05:02:55 +0800
Date: Thu, 18 Oct 2001 05:02:52 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Documentation PARISC 2.0
Message-ID: <20011018050249.B9791@neep.com.au>
References: <20011017134312.A14268@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017134312.A14268@megatonmonkey.net>; from carlos@megatonmonkey.net on Wed, Oct 17, 2001 at 01:43:12PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Quoth Carlos O'Donell Jr.:
> PARISC'ers,
> 
> Does anyone have the PA-RISC 2.0 Architecture and Instruction
> Set Reference Manual in pdf format? (or ps format)
> 
> I have the PA-RISC 1.1 docs, but the 2.0 docs seem to be 
> available only as online html.
> 
> c.

It may not be as nice as the Official HP stuff, but in Linux you can
roll your own PDF documents from the online html using html2ps and
ps2pdf from the html2ps and gs packages in Debian, respectively.  It's
not Adobe Distiller but the result is pretty good.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
