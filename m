Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id D9360482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 16:21:25 -0600 (MDT)
Message-ID: <3F187696.8030604@tiscali.be>
Date: Fri, 18 Jul 2003 22:37:10 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org, Helge Deller <deller@gmx.de>
References: <3F0BEA8300000F84@ocpmta1.freegates.net>
In-Reply-To: <3F0BEA8300000F84@ocpmta1.freegates.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] Re: Xfree-server and Xhp ?
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

Joel Soete wrote:

>>>>>     ldo 0x40(sp),sp
>>>>>          
>>>>>
>>^^^^^^^^^^^^^^^^^^^^^^^^^^That was I suspected to be 'som' specific
>>
>>that means a 64-byte stack.. should be fine on palinux as well.
>>    
>>
>
>Ok I will so try like this (after % and other stuff translation) :-)
>
>Thanks again,
>    Joel
>
Just a follow-up to mentioned that it works (*.s compiling). 
Unfortunately I don't think that I never reach to obtain a full Xhp 
server because I still need some functions (2 or 3) which I didn't found 
nowhere (in the src I got; even thought I found one in a hp lib); I am 
so oblige to abandon ( :_( ).

Thanks again for all,
    Joel
