Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Sven Cronbenberg <sven.cronenberg@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Use the X-Server from HPUX und PALinux? 
In-Reply-To: Message from Sven Cronbenberg <sven.cronenberg@gmx.de>
   of "Sun, 06 Jan 2002 19:54:01 +0100." <3C389D49.7030301@gmx.de>
References: <3C388C82.6070509@web.de> <200201061918.29886.deller@gmx.de>  <3C389D49.7030301@gmx.de> 
Date: Mon, 07 Jan 2002 09:35:44 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020107163544.D9FE5482A@dsl2.external.hp.com>
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

Sven Cronbenberg wrote:
> I wonder if there could be a chance to get the X-Server
> from HPUX working under PALinux. Would the HPUX
> compatiblity be good enough to have a chance whith
> that?

Well, originally that was the plan John Marvin had but I don't think
he's had time to work on the missing kernel support (ioctl calls for
gfx card drivers). If someone wants to try it and report what's missing,
we might find time to get it working peice meal.  In general, HPUX 32-bit
SOM binary support is in place though no one is regularly testing it.

grant
