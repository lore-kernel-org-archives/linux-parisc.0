Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA07474
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 18:50:04 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 May 2000 00:50:02 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA13645;
	Thu, 4 May 2000 10:49:54 +1000
Date: Thu, 4 May 2000 10:49:54 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error 
In-Reply-To: <200005040040.RAA14682@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0005041047580.8334-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 3 May 2000, Grant Grundler wrote:

> Alan Modra wrote:
> 
> > On another issue, can someone tell me why the assembler comment character
> > needed to be changed from `;' to `!' ?  This seems a really ill-advised
> > change to me.
> 
> See:
> http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/03-Mar/0078.html

Thanks for the pointer.  I agree with all these except the comment
change...  :)

-- 
Linuxcare.  Support for the Revolution.
