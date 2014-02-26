From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: Re: 3.12.8 is doing nasty things
Date: Wed, 26 Feb 2014 21:32:38 +0200
Message-ID: <20140226193238.GA671@drone.musicnaut.iki.fi>
References: <2696873.HIAXvrDslF@caliban.sf-tec.de>
 <8596393.NVJnYl104a@caliban.sf-tec.de>
 <1712740.zFjPFKGkFe@caliban.sf-tec.de>
 <5116135.sX67MB4Kjr@caliban.sf-tec.de>
 <trinity-903a5549-9385-4d6f-b51b-4892f056a959-1393424775606@3capp-gmx-bs50>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-903a5549-9385-4d6f-b51b-4892f056a959-1393424775606@3capp-gmx-bs50>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 26, 2014 at 03:26:15PM +0100, Helge Deller wrote:
> On a debian-kernel linux-image-3.13-1-parisc64-smp (3.13.4-1) and the latest libc6
> which Dave uploaded, I'm now seeing similiar issues which are most likely related:
> 
> lsXX:~# dpkg-reconfigure locales
> Generating locales (this might take a while)...
>   de_DE.ISO-8859-1...cannot map archive header: Invalid argument

This is caused by this: http://marc.info/?l=linux-parisc&m=138748066325722&w=2

A.
