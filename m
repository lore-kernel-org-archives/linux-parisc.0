Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 924D6483F
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 05:31:58 -0600 (MDT)
To: Stephan Trajkoff <stephan@itp.bg>
Subject: Re: [parisc-linux] k210/819 Zalon driver
Message-ID: <1026212954.3d2ac45a69282@nyepost.start.no>
Date: Tue, 09 Jul 2002 13:09:14 +0200 (CEST)
From: Andy Walker <squawker@start.no>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
References: <3D2A9711.4030207@itp.bg> <20020709072916.GH6681@sleepie.demon.co.uk> <3D2AC7BD.5060707@itp.bg>
In-Reply-To: <3D2AC7BD.5060707@itp.bg>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Stephan Trajkoff <stephan@itp.bg>:

> T think that my HP K210 don't have any PCIs or EISAs...
> dmesg don't show me that I have any PCIs or EISAs...
> and I have ncr53c720 not 8xx
> 

No, you don't have PCI or EISA, but you do need the PCI code for the
time being. Although the Zalon board has a 720, it is driven by
the 8xx code. The 53c8xx driver has been modified to handle the 720
(which is a lot closer to the 8xx chips in terms of scrip capabilities
than its poor 700 and 710 relations).

-Andy



> 
> Richard Hirst wrote:
> 
> >On Tue, Jul 09, 2002 at 10:56:01AM +0300, Stephan Trajkoff wrote:
> >  
> >
> >>Hi,
> >>why I need to enable PCI/EISA to make available option zalon driver in
> 
> >>SCSI drivers?
> >>My HP K210 don't have PCIs and EISA?!!?!?!?
> >>    
> >>
> >
> >At the moment you have to enable PCI because that is the way the
> config
> >script is organised.  I don't know if zalon support would build
> without
> >PCI because it uses the ncr53c8xx driver which normally drives only
> PCI
> >chips.  It is an area that needs attention anyway, because if you
> enable
> >sym53c8xx_2 you wont get the zalon option at all (which is obviously
> >wrong).
> >
> >Richard?!!?!?!?
> >
> >
> >_______________________________________________
> >parisc-linux mailing list
> >parisc-linux@lists.parisc-linux.org
> >http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> >
> >  
> >
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 


------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
