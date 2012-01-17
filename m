From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Boot error using 3.2.1: swapper (pid 1): Illegal instruction
 (code 8)
Date: Tue, 17 Jan 2012 14:54:24 +0400
Message-ID: <1326797664.3020.30.camel@dabdike>
References: <5333929.7Zifozzp4e@devpool02>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5333929.7Zifozzp4e@devpool02>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2012-01-17 at 11:41 +0100, Rolf Eike Beer wrote:
> Machine is an Apollo 705, previous kernel version was 2.6.28. Any hints 
> appreciated. Config attached.

Best guess is that your init binary is incompatible with the hardware
architecture.  It has to be compiled for PA7000 to work on an Apollo
system.

James


