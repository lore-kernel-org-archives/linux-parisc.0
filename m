Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c003.snv.cp.net (h004.c003.snv.cp.net [209.228.32.218])
	by dsl2.external.hp.com (Postfix) with SMTP id 353774829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 21:22:54 -0600 (MDT)
Date: Sun, 22 Sep 2002 23:22:50 -0400
Subject: Re: [parisc-linux] Problems with 715/80
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v546)
Cc: parisc-linux@lists.parisc-linux.org
To: Christian Weerts <chw@ffis.de>
From: Chuck Slivkoff <caslivkoff@telocity.com>
In-Reply-To: <20020922211630.GB1936@familie-weerts.de>
Message-Id: <BD69FB20-CEA3-11D6-827A-000393581E44@telocity.com>
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

I would suggest that you disconnect any disks and power on the box.  
Make sure your null-modem cable is attached to serial port "a" and no  
keyboard is attached via the PS2/HIL adapter box. You will need to get  
to the PCD "BOOT_ADMIN>" prompt before you can get any further. If you  
can not get to this prompt, take note of the LED's being displayed. The  
service manual for the 715 should help to decode the LED's.

http://h20000.www2.hp.com/bizsupport/ 
CoreRedirect.jsp?targetPage=http%3A%2F%2Fh200002.www2.hp.com%2Fbc%2Fdocs 
%2Fsupport%2FSupportManual%2Flpv37699%2Flpv37699.pdf

Hope this helps.

-chuck


On Sunday, Sep 22, 2002, at 17:16 US/Eastern, Christian Weerts wrote:

> Hello everybody,
>
> I've got an 715/80 here and have problems to get a console.
>
> I've switched a Nullmodem Cable to my Laptop and configured
> minicom as discribed in the Boot-HOWTO - no sign of life.
>
> Then I attached my Monitor to the machine and noticed that I
> got a signal to the (SVGA) Monitor but no message appeared -
> nothing than a blank screen in 1024x768 resolution as my
> Monitor told me on his little Display.
>
> At this point I pressed serveral times the ESCAPE-Button or
> the TAB-Key (as mentioned in the HOWTO) at boottime, but no
> reaction.
>
> What else can I do?
>
> Greets,
>     Christian
>
> -- 
> May the Source be with you...
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
