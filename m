Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE5BA482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Feb 2002 07:41:40 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Enrik Berkhan <Enrik.Berkhan@planb.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial baud_base, high baud rates and divisors
Date: Thu, 7 Feb 2002 15:41:34 +0100
References: <20020207130852.C3306@electra.intern.planb.de>
In-Reply-To: <20020207130852.C3306@electra.intern.planb.de>
MIME-Version: 1.0
Message-Id: <E16Ypjz-0000uP-00@linuxlab.wdf.sap-ag.de>
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

On Thursday 07 February 2002 13:08, Enrik Berkhan wrote:
> Hi,
>
> when using a 720 (running linux, of course ;-) as serial console
> for a 715(old) I've noticed that the terminal (720) produces garbage
> when the 715 comes to the firmware prompt (both running at 115200).
> This is not a flow control or something problem. Investigating on
> that I've found some oddities concerning setserial, baud_base and
> the divisor calculation in the serial driver ...

AFAIK the firmware output only happens at 9600 baud (8N1) and you can't 
change that. After the linux kernel has booted you can of course use
a higher rate.

Helge
-- 
Helge Deller
SAP AG - LinuxLab and Unix Platforms
email: helge.deller@sap.com
