Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33FF54829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 03:01:33 -0600 (MDT)
Message-ID: <3D4E4DB5.8070101@freebel.net>
Date: Mon, 05 Aug 2002 10:04:37 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Alex Green <alexdgreen@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3600 + Xfree86
References: <OE51KKQpQq5pneeFUtL0000219c@hotmail.com>
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

Hey Alex,

Alex Green wrote:
> Hi All,
>  
> Well I've just got my C3600 booting,
Great
> however I have a problem with my 
> fxe5.  Even with X configured for the fb device, the start log for X 
> reports "unknown device".
>  
> Can anyone help, do I need to do something special to get X running. I'm 
> used the STI kernel patch netinst image.
>  
Do you try to use XF86Config-4 from ftp://ftp.parisc-linux.org/XFree86/

Just pay attention that the actual resolution of your screen (at boot 
prompt you should find a menu which can give you this info) must match 
the 'Mode ...' you set in 'SubSection "Display"' for the rest it should 
works.

Good luck,
	Joel
