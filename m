Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.planb.de (aldebaran.planb.de [212.227.14.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A7A6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Feb 2002 09:31:04 -0700 (MST)
Date: Thu, 7 Feb 2002 17:31:03 +0100
To: Helge Deller <helge.deller@sap.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial baud_base, high baud rates and divisors
Message-ID: <20020207173103.A4233@electra.intern.planb.de>
References: <20020207130852.C3306@electra.intern.planb.de> <E16Ypjz-0000uP-00@linuxlab.wdf.sap-ag.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <E16Ypjz-0000uP-00@linuxlab.wdf.sap-ag.de>
From: Enrik Berkhan <Enrik.Berkhan@planb.de>
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

On Thu, Feb 07, 2002 at 03:41:34PM +0100, Helge Deller wrote:
> AFAIK the firmware output only happens at 9600 baud (8N1) and you can't 
> change that. After the linux kernel has booted you can of course use
> a higher rate.

The firmware allows higher baud rates, at least on the 710, 715 and 720.
I'm using it, so it does work ;-) Try "help rs232" when in boot admin
mode.


Enrik
-- 
Enrik Berkhan                                         plan b. GmbH
                                                      Rüppurrer Straße 4
+49-721-388582 (voice)                                76137 Karlsruhe
+49-721-388581 (fax)                                  Germany
