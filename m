Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo3.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 229B74892
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  6 Mar 2004 15:31:15 -0700 (MST)
Message-ID: <404A5174.7010107@tiscali.be>
Date: Sat, 06 Mar 2004 22:32:20 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Marc Dilasser <marc.dilasser@free.fr>
Subject: Re: [parisc-linux] Configuring serial ports
References: <200403062154.40308.marc.dilasser@free.fr>
In-Reply-To: <200403062154.40308.marc.dilasser@free.fr>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Marc,

I also have a 2 b180 (1 runing 2.4.2? and  the other 2.6.4-rc2-pa?) (running a lightweight fw) to connect successfully my isp with 
a 38k baud modem :). But it's a long time that I update those system to testing debian, more over there are 3 releases of woody, 
so can you recall me which kernel is running on your system, and which ppp release is installed.

btw can you check in /boot/config? if ppp support is setup in your kernel?

Regards,
	Joel

Marc Dilasser wrote:
> Hello,
> 
> I have a B180L with Debian Woody and i'm trying to connect to my ISP through a 
> 56k modem.
> 
> I don't find in the dmesg the ports address of the serial ports.
> And how to setup with setserial, baud_base seems to be 454545.
> 
> Regards
> Marc Dilasser
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
