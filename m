Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx0.gmx.net (mx0.gmx.net [213.165.64.100])
	by dsl2.external.hp.com (Postfix) with SMTP id AC2514830
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 03:54:17 -0600 (MDT)
Date: Thu, 19 Jun 2003 11:54:11 +0200 (MEST)
From: adrian.criveanu@gmx.co.uk
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
References: <20030618235358.54006.qmail@web12502.mail.yahoo.com>
Subject: RE: [parisc-linux] Re: Visualize EG card on HP PARISC C360
Message-ID: <6259.1056016451@www20.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
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

Hi!

I apologize for intruding upon you, but I have a C240 with a A4450A (GSC)
card and I couldn't make it work. I was even under the impression that only the
PCI version of it is supported (as I read in some e-mails). I used the 3.0
CDs. It would be highly appreciated if you could tell me what are the steps to
make it work under X, as now it only works for me if I connect to the C240
over a serial port.

I apologize again if you've already answered that before, but I couldn't
find much documentation out there to tell me exactly what to do. People talk
abot different kernel versions and things like that but a "how to" kind of
document would be very, very helpful and I think would make more people try Debian
on PA-RISC boxes. 

Thank you very much and apologie again for bothering you.

Best regards,

Adrian

> You will need one of the following cards:  A4977A (PCI), A4450A (GSC), or
> A4451A (GSC dual head).  Part numbers are listed below.  You will also
need
> an EVC to 15-pin converter for all of these cards and that part number is
> listed below also.  All of this info came from partsurfer.hp.com (no "www"
> in front of it).  There is a PCI EG card for sale on Ebay:  
>  
>
http://cgi.ebay.com/ws/eBayISAPI.dll?ViewItem&item=3031053367&category=11221
>  
> Looks like Cypress Tech ( sales@cypress-tech.com) have some of the A4450A
> GSC cards, but I've never had any dealings with them.  Their prices on
Ebay
> seem high though.   Good luck.
>  
> A4450-66501636.00VISUALIZE-EG graphic accelerator board - For 2D and 3D
> wireframe graphics - Includes color recovery (P/O A4450A) 
> 
> 
> A4451-665011644.00Dual VISUALIZE-EG graphic accelerator board - For 2D and
> 3D wireframe graphics - Includes color recovery (A4451A) 
>  
> 1253-063528.00Enhanced Video Connector (EVC) video adapter cable - EVC(M)
> to 15-pin(F) - 7.87in (0.2m) long - Used to connect EVC video output to
> 15-pin monitor 
>  
> A4977-66501VIZUALIZE-EG/PCI 
> 
> Zlatan Jukic <zlatan.jukic@fh-vorarlberg.ac.at> wrote:
> 
> Hello Derek and all,
> 
>  
> 
> Thank you for your assistance.  Thank you Grant, too!
> 
>  
> 
> You already tested this card (Vis EG HSC) on your HP-Visualize C360
> machine. The X-Windows system should be started in this case.  
> 
> Can you say me please, where can I find/order and buy this card?
> 
>  
> 
> Thank you very much,
> 
> Kind regards, Zlatan
> 
>  
> 
> -----Original Message-----
> From: Derek Engelhaupt [mailto:derekengelhaupt@rocketmail.com] 
> Sent: Mittwoch, 18. Juni 2003 18:00
> To: Grant Grundler; Jukic Zlatan
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Re: Visualize EG card on HP PARISC C360
> 
>  
> 
> Yes, there is an HSC EG card.  Used it in my C360 before I sold it.  The
> PCI version of the card has more memory on it though.
> 
> 
>  
> 
> 
> derek
> 
> Grant Grundler <grundler@parisc-linux.org> wrote:
> 
> 
> On Tue, Jun 17, 2003 at 04:17:02PM +0200, Zlatan Jukic wrote:
> > I could not start unfortunately the X-Windows system, because it is not
> > supported by Fx-4 video card.?!
> 
> correct
> 
> > My question is here: Must I insert another card (and which??), in order
> to
> > start X-Windows-system?
> 
> > According to Debian HPPA, the Visualize EG should correct to function. 
> 
> yes. *PCI* version of the card.
> Vis-EG HSC card might also work.
> 
> > This card is a 24-bit-video-card, which is recognized in the best way
> under
> > Linux as "Coral" with HP 715-64, 
> 
> Is that really a Vis-EG HSC card?
> Can you post "dmesg" output where STI describes the card?
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> ---------------------------------
> 
> 
> Do you Yahoo!?
> SBC Yahoo! DSL - Now only $29.95 per month!
> 
> 
> 
> ---------------------------------
> Do you Yahoo!?
> SBC Yahoo! DSL - Now only $29.95 per month!

-- 
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte lächeln! Fotogalerie online mit GMX ohne eigene Homepage!
