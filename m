Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7569F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 08:33:35 -0700 (MST)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.80.150])
	by mail.esiee.fr (Postfix) with ESMTP id D457C49BF8
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 16:33:33 +0100 (CET)
Date: Mon, 14 Jan 2002 16:33:33 +0100
Subject: Re: [parisc-linux] 0.9.3 on a graphics console
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v480)
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3C434AFE.4060506@chello.nl>
Message-Id: <117AF172-0904-11D6-AEFA-0030656F07A2@esiee.fr>
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

>
> For hardware.. it's a C240 and sam reports a HP visualize FX2(4) as a 
> graphics card that is connected to a VGA monitor which works ok in 
> HP-UX. If you can tell me how to get more detailed hardware information 
> in HP UX, i'll be happy to provide it.

Well, I bet this specific off board graphic card is not supported.
Although onboard controllers are getting more and more supported, it is 
not the case for specific HP hardware.

As there's no core graphics for your box, I suggest you to try with 
serial console.


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin
