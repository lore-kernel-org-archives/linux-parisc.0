Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA06456
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 15:19:52 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 26B45B007; Wed, 15 Nov 2000 22:19:29 +0000 (GMT)
Date: Wed, 15 Nov 2000 22:19:29 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] dino maintainer?
Message-ID: <20001115221929.Q32715@linuxcare.com>
References: <20001114101704.Y32715@linuxcare.com> <200011141610.IAA11646@milano.cup.hp.com> <20001115095835.I32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001115095835.I32715@linuxcare.com>; from rhirst@linuxcare.com on Wed, Nov 15, 2000 at 09:58:35AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 15, 2000 at 09:58:35AM +0000, Richard Hirst wrote:
> But Helge has problems with the sym53c8xx driver on a B160L.  Is

Turned out to be a 53c720, driven via Zalon and the ncr53c8xx driver.
Driver worked as a module, but not compiled in.  Now fixed.

Richard
