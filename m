Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07DCA4833
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 03:43:27 -0600 (MDT)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.7.13])
	by mail.esiee.fr (Postfix) with ESMTP id 1D83449BE4
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 11:43:25 +0200 (CEST)
Date: Thu, 27 Jun 2002 11:43:24 +0200
Mime-Version: 1.0 (Apple Message framework v482)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Thibaut VARENE <varenet@esiee.fr>
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
Message-Id: <534E0E66-89B2-11D6-ACD4-0030656F07A2@esiee.fr>
Subject: [parisc-linux] Kernel > -pa41 debian-configs file not adequate
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

Hi fellows,

Well I have noticed yesterday when building the -pa41 and -pa42 netinst 
ISO that the debian-configs files were not reflecting the changes that 
Helge made to the kernel source, and therefore the scripted build could 
not achieve, as it stopped there:

*
* HIL support
*
HIL core support (CONFIG_HIL) [Y/m/n/?]
   HIL Keyboard (basic) support (CONFIG_HIL_KBD_BASIC) [N/y/?] (NEW)


I could possibly fix that, but I don't know whether it should be 'Y' or 
'N', or maybe there is some *maintainer* who will do that better than 
me ;)

Greetings,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
