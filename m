Return-Path: <JKonrad@linotype.com>
Received: from mail.linotype.com (events.linotypelibrary.com [213.61.7.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4EB3B4DEA
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 01:54:06 -0600 (MDT)
Subject: Antwort: Re: [parisc-linux] problems installing on k 200
To: Ryan Bradetich <rbradetich@uswest.net>
Message-ID: <OF394C6696.D015ED94-ONC1256E70.002B26AF@fonts.de>
From: JKonrad@linotype.com
Date: Thu, 8 Apr 2004 09:52:43 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Hello Ryan,

sorry for being a newbie, but:

how do I check the major number of this driver?
how do I change this number?
where is this number to be found?

Yours

Jay


                                                                                                                                                                      
                      Ryan Bradetich                                                                                                                                  
                      <rbradetich@uswest.net>                 An:       JKonrad@linotype.com                                                                          
                      Gesendet von:                           Kopie:    parisc-linux@lists.parisc-linux.org                                                           
                      parisc-linux-bounces@lists.paris        Thema:    Re: [parisc-linux] problems installing on k 200                                               
                      c-linux.org                                                                                                                                     
                                                                                                                                                                      
                                                                                                                                                                      
                      08.04.2004 03:07                                                                                                                                
                                                                                                                                                                      
                                                                                                                                                                      




Jay,

There was a major number change for the MUX driver in the 2.4 kernels.

Check the major number for /dev/ttyB0, and either change it to 11 from
60 or 60 from 11.

Hope that helps!

- Ryan


On Wed, 2004-04-07 at 07:06, JKonrad@linotype.com wrote:
> Hi,
>
> I have just tried to install my K 200 with this netinstall.iso:
>
> palinux-2.4.21-pa6-20030718-netinst.iso
>
> which is the newest. This image allows me to fully install the machine using the CD, but when I reboot my machine, it boots Linux, then hangs, telling me:
>
> bin/sh: /dev/ttyB0: No such device
>
> It looks like the kernel on the CD supports ttyB0, but the kernel the CD installs does not. How can that be, and how can I fix this?
>
> Yours,
>
> Jay
>
> P.S.: The latest full image debian-30r1-hppa-binary-NONUS.iso won't even let me install, it hangs immediately, telling me my console isn't right, although I set it on ttyB0 with IPL.
>
> PPS: the e-mail for bug reports does not seem to work anymore
>
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
