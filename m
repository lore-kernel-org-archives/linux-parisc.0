Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2E124851
	for <parisc-linux@parisc-linux.org>; Tue, 11 Jun 2002 11:55:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17Hprx-0006uq-00; Tue, 11 Jun 2002 18:55:49 +0100
Date: Tue, 11 Jun 2002 18:55:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: Gianpiero Fasulo <gfasulo@kingcom.it>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Message-ID: <20020611185549.L27449@parcelfarce.linux.theplanet.co.uk>
References: <012801c21122$35e2a000$86000a0a@kingdom> <20020611123839.H27449@parcelfarce.linux.theplanet.co.uk> <002b01c21163$c2ac4720$86000a0a@kingdom> <20020611172524.K27449@parcelfarce.linux.theplanet.co.uk> <006901c21165$e2c7a8e0$86000a0a@kingdom>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <006901c21165$e2c7a8e0$86000a0a@kingdom>; from gfasulo@kingcom.it on Tue, Jun 11, 2002 at 06:34:41PM +0200
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

On Tue, Jun 11, 2002 at 06:34:41PM +0200, Gianpiero Fasulo wrote:
> HI,
> i don't want to modify .config by hand, but when i give make oldconfig, the
> CONFIG_PARISC in not CONFIG_PARISC64.
> OK?

you always get CONFIG_PARISC.  you get CONFIG_PARISC64 as well if you
select it.

stop trimming the list from your replies -- this isn't a free help
service for you alone.

-- 
Revolutions do not require corporate support.
