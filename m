From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Use LINUX_GATEWAY_ADDR define instead of
 hardcoded value value
Date: Mon, 31 Oct 2016 10:26:37 +0100
Message-ID: <58170E4D.4050801@gmx.de>
References: <20161029215243.GA24444@ls3530.box>
 <2532502.E0v7kgWD9v@daneel.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: Rolf Eike Beer <eike-kernel@sf-tec.de>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2532502.E0v7kgWD9v@daneel.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 30.10.2016 11:23, Rolf Eike Beer wrote:
> Helge Deller wrote:
> 
>> LINUX_GATEWAY_ADDR is defined in unistd.h. Let's use it.
> 
> value value?

I do see huge value in being able to see where this value is being
used. A new developer who uses grep will find the relevant assembler
code as well.

Helge
