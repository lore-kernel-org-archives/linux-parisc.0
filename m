Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA25200
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 15:21:06 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 15 Jan 2001 22:24:47 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14II3D-0007dY-00; Mon, 15 Jan 2001 22:24:31 +0000
Date: Mon, 15 Jan 2001 22:24:31 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Stan Sieler <sieler@allegro.com>
Cc: Jane Vinet <jvinet@linuxcare.com>, Matthew Wilcox <matthew@wil.cx>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] website
Message-ID: <20010115222431.C28689@parcelfarce.linux.theplanet.co.uk>
References: <3A631530.29D686AD@linuxcare.com> <200101151933.LAA19576@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101151933.LAA19576@opus.allegro.com>; from sieler@allegro.com on Mon, Jan 15, 2001 at 11:33:28AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 15, 2001 at 11:33:28AM -0800, Stan Sieler wrote:
> The key, probably the most important thing in web page design, is to
> *NOT* override the user's font defaults.  Web pages with font sizes, colors, &
> styles are simply evil.  There are pages I can no longer read with Netscape,
> because the @#$%^ web designer went out of their way to choose a small
> font...and that's *real* small on a 1600x1200 display!  MSIE let's me 
> go to Tools/Internet Options/Accessibility and say:
> 
>    ignore font colors on page
>    ignore font size on page
> 
> ...which is simply wonderful.

Netscape has a simlar thing; however it ignore this preference when
rendering tables.  I went and checked out the mozilla classic codebase
once and saw exactly how to fix it, but they'd already forked mozilla
seamonkey at that point, so i didn't bother.

> Remember, the three most important things to consider when
> designing a web page are: content, content, and content.
> Look / feel / wow isn't in the top three!

i couldn't agree more.

-- 
Revolutions do not require corporate support.
