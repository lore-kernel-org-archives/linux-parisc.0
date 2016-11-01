From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: [PATCH] parisc: Use LINUX_GATEWAY_ADDR define instead of
 hardcoded value value
Date: Tue, 1 Nov 2016 19:25:12 +0100
Message-ID: <20161101192512.1cd9bb27@wim.fritz.box>
References: <20161029215243.GA24444@ls3530.box>
        <2532502.E0v7kgWD9v@daneel.sf-tec.de>
        <58170E4D.4050801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <58170E4D.4050801@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 31 Oct 2016 10:26:37 +0100
Helge Deller <deller@gmx.de> wrote:

> On 30.10.2016 11:23, Rolf Eike Beer wrote:
> > Helge Deller wrote:
> >   
> >> LINUX_GATEWAY_ADDR is defined in unistd.h. Let's use it.  
> > 
> > value value?  
> 
> I do see huge value in being able to see where this value is being
> used. A new developer who uses grep will find the relevant assembler
> code as well.

Yes, but "value value"! ;-)


Regards,
     jer
