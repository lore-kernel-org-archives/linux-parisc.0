Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id VAA22915
	for <parisc-linux@sod.res.cmu.edu>; Wed, 7 Apr 1999 21:33:24 -0400
Message-ID: <19990407213316.T11091@cmu.edu>
Date: Wed, 7 Apr 1999 21:33:16 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: Justin Maurer <justin@master.debian.org>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] binutils from cvs broke
References: <19990407192743.A25057@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990407192743.A25057@debian.org>; from Justin Maurer on Wed, Apr 07, 1999 at 07:27:43PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Apr 07, Justin Maurer wrote:
> creating libtool
> configure: error: GAS does not support target CPU i386
> Configure in /home/parisc/cvs/binutils/gas failed, exiting.
> 
> the command i used to run configure with was:
> $ ./configure --prefix=/home/parisc/hppa-test/

You probably want to be doing
"./configure --prefix=/home/parisc/hppa-test --target=hppa-linux --with-gas"
unless I miss my guess.

-Phil

------------------------------------------------------------------
"In film you will find four basic story lines. Man versus man, man
versus nature, nature versus nature, and dog versus vampire."
        - Steven Spielberg
