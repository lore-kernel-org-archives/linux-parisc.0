Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FABC482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Jul 2002 11:21:53 -0600 (MDT)
Message-ID: <3D4193E4.3060609@freebel.net>
Date: Fri, 26 Jul 2002 18:24:36 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: robert klough <bobklough@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] graphics console only displays the penguin
References: <F7044EomUPAmj10OcX80000c0e0@hotmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hey,



robert klough wrote:
> Hi,
> 
> I've tried installing the latest iso available online (the entire 400MB 
> one), 9.3 I think, through serial console. It worked very well, but now 
> I would like to pass it now on a monitor. But all what I get when I boot 
> is the penguin logo on the top left corner and a blinking cursor. 
> However I see no displayed text at all (the serial console is still 
> available)
What kind of system is it?

Why do not you try netinstall CD available:
http://pateam.esiee.fr/cd-images/testing/

(it is small about 70Mb)

Or the last Debian Woody 3.0 just release (see www.debian.org where to 
download) (but bigger size)

Normaly I test netinstall CD (with a more recent kernel) and it boot 
well with on the graphical screen of my b180. (I hope to test the new 
Debian next week).

> 
> I've been advised to uncomment the line containing ttyS0 in the 
> /etc/inittab, but this line is already uncommented (without the #).
> 

I will see on my station how I setup my inittab.

See you and Good luck,
	Joel
