Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CF604852
	for <parisc-linux@parisc-linux.org>; Tue, 11 Jun 2002 10:25:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17HoSS-0005Al-00; Tue, 11 Jun 2002 17:25:24 +0100
Date: Tue, 11 Jun 2002 17:25:24 +0100
From: Matthew Wilcox <willy@debian.org>
To: Gianpiero Fasulo <gfasulo@kingcom.it>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Message-ID: <20020611172524.K27449@parcelfarce.linux.theplanet.co.uk>
References: <012801c21122$35e2a000$86000a0a@kingdom> <20020611123839.H27449@parcelfarce.linux.theplanet.co.uk> <002b01c21163$c2ac4720$86000a0a@kingdom>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002b01c21163$c2ac4720$86000a0a@kingdom>; from gfasulo@kingcom.it on Tue, Jun 11, 2002 at 06:19:28PM +0200
Subject: [parisc-linux] Re: Kernel compiling problem
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

On Tue, Jun 11, 2002 at 06:19:28PM +0200, Gianpiero Fasulo wrote:
> Then i have do the make config and i have modify the .config file
> (CONFIG_PARISC64=y).
> The make dep is ok but when i give the make vmlinux command i have this

if you modify .config by hand, you must `make oldconfig' afterwards.

-- 
Revolutions do not require corporate support.
