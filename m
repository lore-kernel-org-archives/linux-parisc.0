Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postfix.fh-schmalkalden.de (postfix.fh-schmalkalden.de [194.94.30.58])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4660C487E
	for <parisc-linux@parisc-linux.org>; Mon, 29 Sep 2003 15:27:07 -0600 (MDT)
Date: Mon, 29 Sep 2003 23:25:01 +0200
From: Rene Brothuhn <rene.br@web.de>
To: Matthew Wilcox <willy@debian.org>
Cc: Roman Zippel <zippel@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Matthew Wilcox <willy@debian.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Message-ID: <20030929212501.GA2631@ipgraf11.informatik.fh-schmalkalden.de>
Reply-To: rene.br@web.de
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv> <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=ISO-8859-1
In-Reply-To: <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Sep 29, 2003 at 15:33:17 +0200
Subject: [parisc-linux] Re: NCR53c720
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

On 2003.09.29 15:33 Matthew Wilcox wrote:
> ... Ah ;-)  So where do I find the APUS tree?  From digging around on
> the web (man, there's a lot of broken links in the APUS faq ...), it
> seems to be its own sourceforge project that hasn't switched to working
> on 2.6 yet, is this correct?
> 
> Now that ncr53c8xx is non-PCI only, it should cause the absolute minimum
> of wailing & gnashing of teeth to convert it to use the non-coherent
> dma device API.  It would benefit PA-RISC too as we have two models
> (735 and 755) that have NCR720 chips and a non-coherent architecture.
> Right now, they use the 53c700 driver, but it'd be better to use the
> ncr53c8xx driver, of course.
> 
> Are any APUS people interested in working on this?

Hello!

I'm the one who getting the 53c770 driver working on APUS. The driver is 
based on the code from the ncr53c8xx driver which I found on a 2.4.16 
kernel (maybe it was an other kernel version, I'm not really sure 
anymore). In newer kernels the ncr53c8xx drivers are replaced by sym53c8xx 
which uses a different and more complicated architecture.
In my opinion, the best is to create a seperate 53c720/770 driver based on 
the 53c770 from APUS or ncr53c8xx. I guess the 53c770 from APUS should 
work (with some changes) on a 720 (or similar), because the 770 was 
designed to replace the 720. But I don't know anything about 735 and 755.
But the APUS driver is a really big "patchwork", has some problems and 
needs a clean-up. And I haven't worked on the driver since a year due to 
lack of time, sorry.

I still have lack of time, but if there are any questions, I will help. It 
will be nice to have a native 720/770 driver... And maybe, if someone 
tries to port this driver to a PA, I have to go for it...


Ciao, Renè
