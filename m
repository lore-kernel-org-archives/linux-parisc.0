Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BEE448B9
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Dec 2003 11:21:43 -0700 (MST)
Message-ID: <3FE5E4E6.2090208@tiscali.be>
Date: Sun, 21 Dec 2003 18:22:30 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] audit for copyright/license
References: <20031221041802.GB12969@colo.lackof.org>
In-Reply-To: <20031221041802.GB12969@colo.lackof.org>
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



Grant Grundler wrote:
> Hi all,
> I noticed linux-2.6:arch/parisc/kernel/firmware.c didn't
> have a license (eg GPL) to stipulate terms of distribution.
> I'll add a GPL to it in my next patch.
> 
> Could someone review drivers/parisc, arch/parisc, and include/asm-parisc
> for both copyright and redistribution license?
> 
> A first step is to post a list of file missing either item.
> If there is a "standard format" for either item, it would be
> good to know what it is and whether or not parisc specific
> files are "close enough" (or not).

in COPYING (i.e. GNU GPL version 2) under section "How to Apply These Terms to Your New Programs"
stand what I would trust being the standard formula you are loocking for:
[snip]
     <one line to give the program's name and a brief idea of what it does.>
     Copyright (C) <year>  <name of author>

     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation; either version 2 of the License, or
     (at your option) any later version.

     This program is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.

     You should have received a copy of the GNU General Public License
     along with this program; if not, write to the Free Software
     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

[snip]

(frequently found as eg: arch/parisc/math-emu/driver.c)

hth,
j.
