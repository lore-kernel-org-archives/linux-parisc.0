Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DA524839
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 04:03:08 -0600 (MDT)
From: Helge Deller <helge.deller@sap.com>
To: Thibaut VARENE <varenet@esiee.fr>,
	PA/Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel > -pa41 debian-configs file not adequate
Date: Thu, 27 Jun 2002 12:02:07 +0200
References: <534E0E66-89B2-11D6-ACD4-0030656F07A2@esiee.fr>
In-Reply-To: <534E0E66-89B2-11D6-ACD4-0030656F07A2@esiee.fr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200206271202.07960.helge.deller@sap.com>
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

Hi Thibaut,

Please use CONFIG_HIL=y, CONFIG_HIL_KBD_BASIC=y,
all other HIL configs =n.
I'll fix that later today in CVS.

Greetings,
Helge

On Thursday 27 June 2002 11:43, Thibaut VARENE wrote:
> Hi fellows,
>
> Well I have noticed yesterday when building the -pa41 and -pa42 netinst
> ISO that the debian-configs files were not reflecting the changes that
> Helge made to the kernel source, and therefore the scripted build could
> not achieve, as it stopped there:
>
> *
> * HIL support
> *
> HIL core support (CONFIG_HIL) [Y/m/n/?]
>    HIL Keyboard (basic) support (CONFIG_HIL_KBD_BASIC) [N/y/?] (NEW)
>
>
> I could possibly fix that, but I don't know whether it should be 'Y' or
> 'N', or maybe there is some *maintainer* who will do that better than
> me ;)
>
> Greetings,
>
>
> Thibaut VARENE
> PA/Linux ESIEE Team
> http://pateam.esiee.fr/
