Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from olsztyn.ken.pl (unknown [212.244.122.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 521074835
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Jul 2002 10:11:07 -0600 (MDT)
Received: from h1 (pe113.olsztyn.sdi.tpnet.pl [213.76.233.113])
	by olsztyn.ken.pl (8.11.6/8.9.3) with SMTP id g63GIfT19770
	for <parisc-linux@lists.parisc-linux.org>; Wed, 3 Jul 2002 18:18:41 +0200
Message-ID: <002201c222b5$9fcf8ec0$8501a8c0@pl>
From: "Robert Boehm" <robert@olsztyn.ken.pl>
To: <parisc-linux@lists.parisc-linux.org>
References: <02070315581300.00805@www>
Subject: Re: [parisc-linux] HP9000/710
Date: Wed, 3 Jul 2002 19:18:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

----- Original Message -----
From: "ste" <stemelchior@inwind.it>
To: <debian-hppa@lists.debian.org>; <parisc-linux@lists.parisc-linux.org>
Sent: Wednesday, July 03, 2002 3:58 PM
Subject: [parisc-linux] HP9000/710


> Hi guys,
> I have got an old HP workstation (with DDS, CDROM drive) and when I tried
to
> install Debian-HPPA 0.9.3 on it makes impossible the installation at the
> point when you have to configure the keyboard. I mean that ( I got and old
> HP-HIL keyboard, you know the one with the RJ45-like connector) I weel can
> see on monitor the choises but I am able only to move the cursor upward or
> downward. Then it hangs!!! my question is: how to procede in this step of
> installation?
    Don't choose any keyboard mapping. Go to the next step.
    It works with default kernel mapping.
    I have 710 too, and ISO 0.9.3 works fine, but without HIL and serial
mouse.
    With the new  kernel pa-46 HIL mouse works but serial still not.
    In the new kernel the keyboard mapping is bad but HIL mouse plays fine.



                                                                    Robert
Boehm
