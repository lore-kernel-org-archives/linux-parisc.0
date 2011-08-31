From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap
 (code 7)
Date: Wed, 31 Aug 2011 11:54:29 +0200
Message-ID: <a53708ae6c6247c7ce45d4e5b8131ea7.squirrel@webmail.sf-mail.de>
References: <201108191958.35802.eike-kernel@sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201108191958.35802.eike-kernel@sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The last kernel I used on this machine was 2.6.38.4. Any hints
> appreciated.

I updated the machine to 2.6.38.8 (works fine after applying
b54cd0d5053633373cd3c374aa203024cbf125a0 and reverting
c3f957a22eca106bd28136943305b390b4337ebf) and 3.0.4, which is still
broken. Any ideas?

Eike
