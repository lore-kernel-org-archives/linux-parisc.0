Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68D29482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Apr 2001 04:22:26 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D874CB007; Wed, 11 Apr 2001 11:23:16 +0100 (BST)
Date: Wed, 11 Apr 2001 11:23:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthieu Delahaye <delahaym@esiee.fr>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with fcntl.c
Message-ID: <20010411112316.T6992@linuxcare.com>
References: <3AD34CC0.BE88DE32@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AD34CC0.BE88DE32@esiee.fr>; from delahaym@esiee.fr on Tue, Apr 10, 2001 at 08:11:12PM +0200
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthieu,

On Tue, Apr 10, 2001 at 08:11:12PM +0200, Matthieu Delahaye wrote:
> Hi all!
> 
> while my kernel was booting, I got this dump:
> ...
> Does anyone have a clue of what happened?

No, is it repeatable?  32 or 64 bit kernel?  What h/w?  What compiler?

I agree with your diagnosis; looks like r4 got corrupted somehow.

Richard
