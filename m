Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA27083
	for <parisc-linux@puffin.external.hp.com>; Mon, 8 Jan 2001 09:38:54 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 8 Jan 2001 16:42:23 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14FfN8-0001za-00; Mon, 08 Jan 2001 16:42:14 +0000
Date: Mon, 8 Jan 2001 16:42:14 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Steven Pritchard <steve@silug.org>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Any K200 Experiences Out There??
Message-ID: <20010108164214.A7545@parcelfarce.linux.theplanet.co.uk>
References: <20010108145643.A32433@parcelfarce.linux.theplanet.co.uk> <200101081520.f08FKla09063@osiris.silug.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101081520.f08FKla09063@osiris.silug.org>; from steve@silug.org on Mon, Jan 08, 2001 at 09:20:47AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 08, 2001 at 09:20:47AM -0600, Steven Pritchard wrote:
> Matthew Wilcox said:
> > the kernel on that cd is quite out of date;
> > can you try compiling a new one?
> 
> That reminds me of something I've been meaning to ask...  What all
> needs to be upgraded to update to the latest CVS kernel (from the 0.5
> CD)?  Is it enough to just compile a new kernel, or will glibc and
> various other things need updating too?

the root filesystem i'm using is basically the 0.5 CD.  i managed to not
break anything with the stack changes :-)  [at least, only temporarily..]

-- 
Revolutions do not require corporate support.
