Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C1F7482A
	for <parisc-linux@parisc-linux.org>; Thu,  8 Aug 2002 02:33:11 -0600 (MDT)
Received: from smtp2.fc.hp.com (smtp.fc.hp.com [15.15.136.253])
	by atlrel9.hp.com (Postfix) with ESMTP id ACAF6E00FF7
	for <parisc-linux@parisc-linux.org>; Thu,  8 Aug 2002 04:33:07 -0400 (EDT)
To: "Mazia-Assia KAIDI" <kaidi@letters.grenoble.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Demande de renseignements 
In-Reply-To: Message from "Mazia-Assia KAIDI" <kaidi@letters.grenoble.hp.com>
   of "Tue, 08 Oct 2002 10:14:32 +0200." <CEECILGPPEGMBBILGEHLAEFMCAAA.kaidi@letters.grenoble.hp.com>
References: <CEECILGPPEGMBBILGEHLAEFMCAAA.kaidi@letters.grenoble.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 02:33:04 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020808083304.DD21C37D00@carmen.fc.hp.com>
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

"Mazia-Assia KAIDI" writes...

> Bonjour,
> je suis stagiaire au centre europeen d'integration de HP Villefontaine. mon
> travail consiste en la mise en place d'un outil d'integration portable sous
> linux Redhat, mon souci est de booter sur un serveur HP-UX, mon portable se

What type of hppa system?

> comporte comme un serveur bootp, dhcp et tftp. cependant j'ai un souci au
> niveau du protocole tftp, le transfert de fichiers ne se fait pas: le
> transfert se fait paquet par paquet et au bout d'un moment il y'a un message
> d'erreur indefini: opcode 0.

I haven't seen that before and searching the mailing list doesn't find 
anything either. Did it print any additional information that might be 
useful? If you're using serial console, just cut&paste the output and send 
it.

You might try checking the tftp log on the laptop to see if it's getting 
transferred ok.

Good luck,

-- 
Matt Taggart
taggart@fc.hp.com
