Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 541DC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Jun 2001 10:23:15 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Jay Konrad <jkonrad@fonts.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xbase clients
Date: Tue, 12 Jun 2001 18:22:33 +0200
References: <200106121733551.SM00201@bhopc40002>
In-Reply-To: <200106121733551.SM00201@bhopc40002>
MIME-Version: 1.0
Message-Id: <20010612162315.541DC482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Maybe:

apt-get update
apt-get install xbase-clients

Helge

On Tuesday, 12. June 2001 17:31, Jay Konrad wrote:

> Hi guys!!
>
> Can anybody tell me where I can find those?? My system is almost ready,
> this is the only thing missing!!
>
> Pleeeeze can anybody help me?
>
> I get this message:
>
> bhows49999:/data/archiv# dpkg -i xbase-clients_4.0.3-1_hppa.deb
> (Reading database ... 8929 files and directories currently installed.)
> Preparing to replace xbase-clients 4.0.3-1 (using
> xbase-clients_4.0.3-1_hppa.deb) ...
> Unpacking replacement xbase-clients ...
> dpkg: dependency problems prevent configuration of xbase-clients:
>  xbase-clients depends on libgl1; however:
>   Package libgl1 is not installed.
> dpkg: error processing xbase-clients (--install):
>  dependency problems - leaving unconfigured
> Errors were encountered while processing:
>  xbase-clients
> bhows49999:/data/archiv#
>
> If anybody knows where to get this package, I would be more than happy.
>
> Thanx in advance
>
> Jay
