Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id E61A6482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Sep 2002 00:19:50 -0600 (MDT)
Subject: Re: [parisc-linux] E55
From: Ryan Bradetich <rbradetich@uswest.net>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020910050039.46620.qmail@web12506.mail.yahoo.com>
References: <20020910050039.46620.qmail@web12506.mail.yahoo.com>
Content-Type: text/plain
Date: 10 Sep 2002 00:19:48 -0600
Message-Id: <1031638789.10553.15.camel@beavis>
Mime-Version: 1.0
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

I have been playing with an E35 and I can get the boot to go farther
then that.  Right now the boot is failing somewhere between the LED
detection and the POSIX conformance testing by UNIFIX.  I do not
really care about this failure right now since I am really only
interested in the discovering the missing devices on these systems.

Tonight, I found the missing devices on the system and I am currently
working on figuring out how to integrate this discovery into the
bus walk code.  I hope to have a patch committed within the next day
or so which detects all the devices on the system.  After that I will
add this failure to my TODO list (if the ESIEE will still let me have
access to this system, but i am hoping that someone else will take the
challenge and find/fix the problem :))

Thanks,

- Ryan


On Mon, 2002-09-09 at 23:00, Derek Engelhaupt wrote:
> I was just curious how far in the boot process you E55 guys get.  I
> just tried to load the one I have in the office tonight.  I retrofitted
> it with an A1703-60003 LAN/Console/SCSI card I pulled out of one of our
> "crash and burn" H70 boxes.  It gets past the "console" message about
> "if this is the last thing you see" then starts dumping the stacks and
> ends in a Kernal error 15.  This card doesn't use the mux port to
> connect the console it uses a PS/2 type connector to the card and a
> DB25 connector to the terminal.  Just wanted to see how this compares
> to the other E Series machines out there.
> 
> derek
> 
> __________________________________________________
> Yahoo! - We Remember
> 9-11: A tribute to the more than 3,000 lives lost
> http://dir.remember.yahoo.com/tribute
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
