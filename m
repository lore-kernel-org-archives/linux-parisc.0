Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C5A84840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Jun 2003 17:58:32 -0600 (MDT)
Date: Sat, 14 Jun 2003 23:57:52 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Cc: Matthew Wilcox <willy@parisc-linux.org>
In-Reply-To: <20030614221634.9521F494003@palinux.hppa>
Message-ID: <Pine.BSF.4.53.0306142353310.651@e0-0.zab2.int.zabbadoz.net>
References: <20030614221634.9521F494003@palinux.hppa>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 willy
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

On Sat, 14 Jun 2003, Matthew Wilcox wrote:

Hi,

> CVSROOT:	/var/cvs
> Module name:	linux-2.5
> Changes by:	willy	03/06/14 16:16:33
>
> Modified files:
....
> Log message:
> merged 2.5.71

cvsupped ... and rechecked this moment w/o new updates.

bz@apollo:/u1/src/linux> make oldconfig
  HOSTCC  scripts/fixdep
  ...
  HOSTCC  -fPIC scripts/kconfig/zconf.tab.o
  HOSTLLD -shared scripts/kconfig/libkconfig.so
  HOSTLD  scripts/kconfig/conf
./scripts/kconfig/conf -o arch/parisc/Kconfig
drivers/parisc/Kconfig:148: can't open file "drivers/hotplug/Kconfig"
make: *** [oldconfig] Error 1
bz@apollo:/u1/src/linux>

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
