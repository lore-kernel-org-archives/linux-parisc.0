Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 3 Jan 2003 18:55:26 -0700
To: Steve Cornett <stevec@bullseye.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000 Debian 3.0r1 High-Priority Machine Check
Message-ID: <20030104015526.GB29245@dsl2.external.hp.com>
References: <001b01c2b374$4f810930$a87ba8c0@steve>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001b01c2b374$4f810930$a87ba8c0@steve>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Jan 03, 2003 at 02:06:02PM -0800, Steve Cornett wrote:
> I booted the Debian 3.0r1 CD 1 on my generic B1000 and it crashed.
...
> System Responder Address     = 0xfffffffffed10200
> System Requestor Address     = 0xfffffffffffa0000

"Requestor" is the CPU.
/proc/iomem on my c3k shows "fed00000-fed00fff : SBA" but nothing for
0xfed10200.

...
> Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16 17:09:00 MST 2002

Any chance this could upgraded to at least a 2.4.19?
Or will the new "BF" images Richard posted do that?
(http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018746.htm)
Steve, can you try the beta Boot Floppies?


> 7. Memory (1) at 0xfed10200 [49], versions 0x87, 0x0, 0x9

erm, someone tried to reference the memory controller?

hth,
grant
