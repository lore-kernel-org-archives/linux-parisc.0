From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: report inequivalent aliases only for writeable
 mappings
Date: Thu, 23 Jan 2014 20:21:47 +0100
Message-ID: <52E16BCB.60303@gmx.de>
References: <alpine.LRH.2.02.1401221402190.12739@file01.intranet.prod.int.rdu2.redhat.com>  <1390418695.2372.86.camel@dabdike.int.hansenpartnership.com>  <alpine.LRH.2.02.1401221535290.25455@file01.intranet.prod.int.rdu2.redhat.com> <1390424223.2372.100.camel@dabdike.int.hansenpartnership.com> <alpine.LRH.2.02.1401221629520.1498@file01.intranet.prod.int.rdu2.redhat.com> <BLU0-SMTP653E849DC18BBE6054E93597A70@phx.gbl> <alpine.LRH.2.02.1401221650320.3906@file01.intranet.prod.int.rdu2.redhat.com> <BLU0-SMTP69D00813F3618BE849AA597A60@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>,
	Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP69D00813F3618BE849AA597A60@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Mikulas,

On 01/23/2014 03:26 AM, John David Anglin wrote:
> On 22-Jan-14, at 5:27 PM, Mikulas Patocka wrote:
>> Anyway, the kernel should work with Debian 5 - the only way how to install
>> a new parisc system is to install Debian 5 and then switch to
>> debian-ports.
> 
> Actually, Helge has a lifimage that allows a new Debian system to be setup with debootstrap.
> Helge is working toward new installer.  There's documentation on wiki on how to do it.

Installing Debian unstable from debian-ports is fully described here:
https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
(You will see some inequivalent aliases messages because the lifimage is still based on old binaries)

That's how I installed the debian buildd servers:
http://unstable.buildd.net/index-hppa.html

Helge
