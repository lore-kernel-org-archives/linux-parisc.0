Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C9354829
	for <parisc-linux@parisc-linux.org>; Tue, 24 Dec 2002 16:50:48 -0700 (MST)
Date: Tue, 24 Dec 2002 15:51:47 -0800
From: Randolph Chung <randolph@tausq.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: parisc-linux@parisc-linux.org,
	Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
Subject: Re: [parisc-linux] Generic RTC driver in 2.4.x?
Message-ID: <20021224235147.GT19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.GSO.4.21.0212241451450.1821-100000@vervain.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.4.21.0212241451450.1821-100000@vervain.sonytel.be>
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

> AFAIK the generic RTC driver is used on PA-RISC, PPC, and m68k.
> 
> Are you interested in a backport to 2.4.x?

On parisc we already have a version of the generic RTC driver in our
2.4 tree. If there's something more "official" or common we can adopt
that version. 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
