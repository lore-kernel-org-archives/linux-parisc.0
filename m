Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Helge Deller <helge.deller@sap.com>
Cc: Enrik Berkhan <Enrik.Berkhan@planb.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial baud_base, high baud rates and divisors 
In-Reply-To: Message from Helge Deller <helge.deller@sap.com>
   of "Thu, 07 Feb 2002 15:41:34 +0100." <E16Ypjz-0000uP-00@linuxlab.wdf.sap-ag.de>
References: <20020207130852.C3306@electra.intern.planb.de>  <E16Ypjz-0000uP-00@linuxlab.wdf.sap-ag.de> 
Date: Thu, 07 Feb 2002 09:36:10 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020207163610.63A134832@dsl2.external.hp.com>
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

Helge Deller wrote:
> AFAIK the firmware output only happens at 9600 baud (8N1) and you can't 
> change that.

Actually, I think one can. But I doubt HP is going to fix any firmware
bugs related to console speeds other than 9600.

Running 19200 was crashing A500 console/GSP last year. I finally
convinced the firmware team it was the same problem that happened
at 9600 (less frequently of course).
I haven't verfied it was fixed in new PDC.

grant
