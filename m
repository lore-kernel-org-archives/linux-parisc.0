Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA07606
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 18:54:40 -0600
To: Alan Modra <alan@linuxcare.com.au>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 04 May 2000 10:49:54 +1000.
             <Pine.LNX.4.21.0005041047580.8334-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 May 2000 18:54:24 -0600
Message-ID: <26706.957401664@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0005041047580.8334-100000@front.linuxcare.com.au>yo
u write:
  > On Wed, 3 May 2000, Grant Grundler wrote:
  > 
  > > Alan Modra wrote:
  > > 
  > > > On another issue, can someone tell me why the assembler comment charact
  > er
  > > > needed to be changed from `;' to `!' ?  This seems a really ill-advised
  > > > change to me.
  > > 
  > > See:
  > > http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/03-Mar/0078
  > .html
  > 
  > Thanks for the pointer.  I agree with all these except the comment
  > change...  :)
'!' is the standard comment character for the PA assembly syntax.

jeff
