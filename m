Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta01-srv.alltel.net (mta01.alltel.net [166.102.165.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB7BE482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 21:59:47 -0600 (MDT)
Date: Tue, 14 Aug 2001 22:59:59 -0500 (CDT)
From: "T. Martin" <catfish@alltel.net>
To: Jaime Ash <jaimeash@home.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Creating the installation CD
In-Reply-To: <NEBBJAILOLAHGDBEOCIOAEFJCFAA.jaimeash@home.com>
Message-ID: <Pine.LNX.4.10.10108142258150.3789-100000@jesse.crash.lan>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Jaime, 
 I use cdrecord and just cdrecord dev=0,6,0 speed=2 -eject file.iso but it
depends on your hardware as to the proper device if its scsi just  
cdrecord -scanbus and start from there. 

Hope I helped some. 
Terry

Achilles' Biological Findings:
        (1) If a child looks like his father, that's heredity.  If he
            looks like a neighbor, that's environment.
        (2) A lot of time has been wasted arguing over what came first
            -- the chicken or the egg.  It was undoubtedly the
            rooster.


On Tue, 14 Aug 2001, Jaime Ash wrote:

> I am in the process of trying to upgrade my PA-Linux machine (model HP 715)
> from version 0.6 to version 0.9.2, and also trying to install version 0.9.2
> on an HP 735.
> 
> I have already extracted the file named "palinux-0.9.2.iso" from the
> downloaded file, but I do not know how to proceed from there to create the
> installation CD.  (Note that for version 0.6 I had used an installation CD
> that I got from Grant Grundler, so I never learned how he created the CD,
> and now he is on LOA).
> 
> So my question to you is, what is the process for going from the *.iso file
> to create the CD.
> 
> Sincerely,
> 
> Jaime Ash
> email: jaimeash@home.com
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
