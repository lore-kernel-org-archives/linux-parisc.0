Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FAE4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 09:33:20 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 49563B00C; Wed, 11 Jul 2001 16:32:00 +0100 (BST)
Date: Wed, 11 Jul 2001 16:32:00 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Jari Eskelinen <jari.eskelinen@enfo.fi>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60, kernel 2.4.6 and keyboard.
Message-ID: <20010711163200.P18375@linuxcare.com>
References: <JA8AAAAAAd8izgABYQABMhINAcxU@enfo.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <JA8AAAAAAd8izgABYQABMhINAcxU@enfo.fi>; from jari.eskelinen@enfo.fi on Wed, Jul 11, 2001 at 06:18:00PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 11, 2001 at 06:18:00PM +0200, Jari Eskelinen wrote:
> Hi!
> 
> I have 712/60 machine and I have used 2.4.0-pa30 kernel with it with great success. Today I tried to compile 2.4.6-pa11 kernel (cross-compiling with my P800, it was horrible sloooooow with 721/60 :) and it almost succeeded. Everything else works, but PS/2 keyboard won't just work. Nothing comes to screen when typing. Logging from network works as usual. Kernel seems to recognise keyboard:
> 
> PS/2 keyboard controller at 0xf0108000 (irq 69) found, device attached.
> Lasi PS/2 wait 3734
> PS/2 psaux controller at 0xf0108100 (irq 69) found, device attached.
> 
> But it won't work. Mouse works fine, I can login if playing with mouse and gpm (cut r, paste, cut o, paste paste, cut t, paste, cut return, paste etc.) :D
> 
> Have anybody similiar experiences and most importantly, can anybody tell how to solve ths problem?

Known problem, try unplugging and replugging the keyboard, while the
system is running.  Works for some people.

Richard
