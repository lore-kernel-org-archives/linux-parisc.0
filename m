Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA13258
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 05:05:23 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 12:08:17 -0000
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: lamont@hp.com (LaMont Jones)
Date: Mon, 18 Dec 2000 11:53:26 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), sieler@allegro.com (Stan Sieler),
        matthew@wil.cx (Matthew Wilcox), jes@linuxcare.com (Jes Sorensen),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com,
        lamont@hp.com
In-Reply-To: <20001218044410.DA2DE1872C@security.hp.com> from "LaMont Jones" at Dec 17, 2000 09:43:59 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E147yrB-0005SH-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> we can use for semaphoring (msem_lock comes to mind...), which the lib
> (in arch specific code) either implements in a mixture of user/kernel
> space, or (if you can get to kernel mode cheaply), does it in kernel mode
> via a lightweight system call.
> 
> Note also that spinning in a ldcw is very painful for the bus, and
> switching to a ldw-loop followed by ldcw results in starvation in a
> greater-than-2-way MP system.

That sounds a good reason to do at least most of it in kernel space on hppa
