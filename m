From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] Get your Matrox PCI cards out of the basement ...
Date: Thu, 3 Jun 2004 08:35:25 -0500
Message-ID: <200406030835.25787.mszick@goquest.com>
References: <20040602221734.GA26176@solo.franken.de>
	<20040603032304.GA22448@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040603032304.GA22448@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed June 2 2004 22:23, M. Grabert wrote:
> N.B. the "PLL not locked after 5 secs" messages also appear when
> I try to change the resolution with fbset. fbset is busy for some
> seconds (at first I thought the process locked up), but then returns
> printing out those messages, and another 'fbset' (without arguments)
> afterwards confirms that the resolution has been changed.
> However the monitor stays black ...
>
> Any hints?

Monitor? What monitor? How cabled?
There are three flavors of getting sync to the monitor;
composite, sync on green, and separate...
A display card with a SVGA connector on it will produce
one, two or all three flavors - either conncurrently or selectively
depending on card (manufacturerer, age, etc)...
Similar story with monitors...

If using an older HP (or other) high resolution monitor - it
most likely expects "sync on green" (or "separate" if it uses
BNC connectors)...
While your graphics card may have to be set (either manually
or by software) to produce other than "composite".

The short answer:
Your not out of luck yet - It could be something simple.

Mike
PS: the monitor that came with my 720 (5-BNC connectors)
will run with either "separate" or "sync on green" - it doesn't
recognize "composite" (the pc-world standard).
(Once you buy or build a suitable conversion cable)

PPS: SVGA connector:
1 - red
2 - green (sync on green here)
3 - blue
4 - sense 2
5 - self test (and TTL ground)
6 - red ground
7 - green ground
8 - blue ground
9 - key
10 - sync ground
11 - sense 0
12 - sense 1
13 - Hor. Sync (separate or composite)
14 - Vert. Sync
15 - sense 3
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
