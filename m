Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 463B34A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Mar 2001 21:52:53 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14fx5a-00085V-00; Thu, 22 Mar 2001 04:52:46 +0000
Date: Thu, 22 Mar 2001 04:52:46 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	Giacomo Mulas <gmulas@ca.astro.it>,
	=?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>,
	William Carlsson <william.carlsson@teligent.se>
Subject: Re: [parisc-linux] The new FS of ESIEE Team is ready
Message-ID: <20010322045246.N5491@parcelfarce.linux.theplanet.co.uk>
References: <3AB7AA9F.985576AA@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AB7AA9F.985576AA@esiee.fr>; from marteaut@esiee.fr on Tue, Mar 20, 2001 at 08:08:15PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Mar 20, 2001 at 08:08:15PM +0100, Thomas Marteau wrote:
> Hi all,
> 
> 	The new FS is ready (~61MB). No "more" bugged with the good TERM parameter and
> no password :)
> It is a specially designed for 712 owners but it is a sane fs, we hope.
> 
> Please, go to our DL page: http://mkhppa1.esiee.fr/en/download.html

Hi Thomas.  I tried your package on a J7k here.  You've set /dev/console
to be a symlink to tty0.  Please don't do this, the kernel is supposed to
be able to handle /dev/console by itself, and select either STI console
or serial console as appropriate.

-- 
Revolutions do not require corporate support.
