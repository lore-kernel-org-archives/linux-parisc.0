Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32403482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Dec 2001 04:32:16 -0700 (MST)
Message-ID: <3C0B602B.DE108C44@esiee.fr>
Date: Mon, 03 Dec 2001 12:21:15 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Joerg Hartmann <j.hartmann@reinarts.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] init error on a 720
References: <200112030820.JAA20988@post.webmailer.de>
Content-Type: text/plain; charset=us-ascii
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

HI Joerg,
> 
> as you guess, i like to install Linux on a HP Workstation.
> It is an hp9000 model 720.
> And here the problem starts - on some websites is stated that pa-risc
> linux will never work on 720's  on some other sites i can read it does !
> Maybe it depends - but on what ?

As you'll see, you have the answer hidden in your mail :)
In fact, the official website stated upon the latest ISO released and
our website
( http://mkhppa1.esiee.fr/list.html ) is based on the latest CVS. It is
a great difference. Some drivers have been rewritten or patched and some
CPU support has been added!
> http://mkhppa1.esiee.fr/list.htmlhttp://mkhppa1.esiee.fr/list.html
> So i took the 0.9.2 iso-image from www.parisc-linux.org and tried an
> installation. After switching to serial console i could see the kernel
> coming up until it has to start "init" - than it loops forever with
> 
This has been solved. You need a new boot-fllopy
> handle_interruption() pid=1 command='init'
> On the list archive i found, that some other people had the same problem,
> even with 720 models.  But i could not find a solution which works for me.
> If there is one , could you please tell me where to RTFM ?
Try the CVS mailing list search @
http://www.parisc-linux.org/mailing-lists/index.html !
With PCXS and init, you have this:
http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2001-October/029699.html

> And there is a second problem with the scsi bus :
Richard Hirst has modified the code of the driver to make it work.
Try to pass this in the kernel parameter at boot time:
sim700=nodisc:0xff 
Anyway, more info on that here ->
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-October/014116.html

> I realy hope you can point me to the right direction.
> If i can not  get linux up and running on that box, this computer will be
> put in the waste basket :-(
No, don't do that! :-)

Thomas.
ESIEE Team
