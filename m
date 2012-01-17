From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Boot error using 3.2.1: swapper (pid 1): Illegal instruction
 (code 8)
Date: Tue, 17 Jan 2012 11:55:57 +0100
Message-ID: <5b79ed5857aa29388a3eb41663d5700e.squirrel@webmail.sf-mail.de>
References: <5333929.7Zifozzp4e@devpool02>
    <1326797664.3020.30.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1326797664.3020.30.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, 2012-01-17 at 11:41 +0100, Rolf Eike Beer wrote:
>> Machine is an Apollo 705, previous kernel version was 2.6.28. Any hints
>> appreciated. Config attached.
>
> Best guess is that your init binary is incompatible with the hardware
> architecture.  It has to be compiled for PA7000 to work on an Apollo
> system.

Using the same init with kernel 2.6.28 works fine.

Eike
