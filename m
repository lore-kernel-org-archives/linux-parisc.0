Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA05373
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 07:25:13 -0700
Sender: christoph.plattner@alcatel.at
Message-ID: <3A76CFA2.C1E5A2EC@alcatel.at>
Date: Tue, 30 Jan 2001 15:28:50 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: penfold@customware.com.au
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] _working_ rbootd for redhat
References: <200101301048.VAA30747@customware.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello !

I also have a 720 (9000/720, with 50Mhz) and I often thought
about the idea of using rbootd.

Can you give me some hints, what you have done (what steps)
(I also have RedHat !).

What to do on the 720 machine (with `path lan0.....' I think),
wnat to do on the host, and how to prepare the linux boot image 
(lifimage) ?

By the way, have you booted linux now ?
I had the problem with the trap 18 (perhaps you saw it)
on the 720. It could be fixed by adding the `case 18:'
to that case (15,26, etc), and suddenly the 720 was working !!

With friendly regards

	Christoph Plattner



penfold@customware.com.au wrote:
> 
> Hi all,
> 
> First up, thanks all - I love your work.
> 
> after much trawling of the list archive and altavista I was able to get rbootd
> to at least boot the kernel on a 720.
> CPU(s): 1 x PA7000 (PCX-S) at 50.000000 MHz
> 
> Given that finding this was not easy, how can we the patched source .tar.gz
> available more easily on parisc-linux.org or puffin.external.hp.com ?
> 
> I _really_ hope its not somewhere obvious and I am just a nuff-nuff.
> 
> Also, Is there anyway to hard boot this machine form the serial port when
> a HPMC has happened?
> (eg, control sequence).
> 
> thanks,
> Damian
> penfold@customware.com.au
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
