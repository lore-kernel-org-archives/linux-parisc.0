Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1.ewetel.de (mail1.ewetel.de [212.6.122.14])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD2A14829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 16:05:59 -0600 (MDT)
Date: Tue, 24 Sep 2002 00:05:41 +0200
From: Christian Weerts <chw@ffis.de>
To: Chuck Slivkoff <caslivkoff@telocity.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with 715/80
Message-ID: <20020923220541.GA962@familie-weerts.de>
Reply-To: Christian Weerts <christian@familie-weerts.de>
References: <20020922211630.GB1936@familie-weerts.de> <BD69FB20-CEA3-11D6-827A-000393581E44@telocity.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <BD69FB20-CEA3-11D6-827A-000393581E44@telocity.com>
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

* Chuck Slivkoff <caslivkoff@telocity.com> [020923 05:22]:
> I would suggest that you disconnect any disks and power on the box.  
> Make sure your null-modem cable is attached to serial port "a" and no  
> keyboard is attached via the PS2/HIL adapter box. You will need to get  
> to the PCD "BOOT_ADMIN>" prompt before you can get any further. If you  
> can not get to this prompt, take note of the LED's being displayed. The  
> service manual for the 715 should help to decode the LED's.
> 
> http://h20000.www2.hp.com/bizsupport/ 
> CoreRedirect.jsp?targetPage=http%3A%2F%2Fh200002.www2.hp.com%2Fbc%2Fdocs 
> %2Fsupport%2FSupportManual%2Flpv37699%2Flpv37699.pdf
> 
> Hope this helps.
> 
It does. With the manual i decode the LED's. They say:
Memory error! Ughf, after a long period not running the
machine a matter of time i think. So i go on and cleaned the
memory-sticks and the memory-banks 0-3. But that wasn't very
helpful. Changing the sticks to serveral banks (i did it
more than an half hour) gave me also no result. Once there
was another message from the LED's - HPMC due to memory
error! Not very helpful for me.

What kind of sticks are normal or the best one? Is there a
prefered memory-bank to use? The memory in this machine was 
attached to bank 3+2 with 72-Pin NEC and Noname chips. But
both "Made in Puerto Rico" ;). I never (really) changed the
memory since the time i got the machine.

Greets,
    Christian

-- 
[X] <--- Nail here for new Monitor.
