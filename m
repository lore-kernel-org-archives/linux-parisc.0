Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4981B4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Jan 2003 05:35:41 -0700 (MST)
Date: Wed, 8 Jan 2003 13:35:32 +0100
Subject: Re: [parisc-linux] Visualize FX2
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: parisc-linux@lists.parisc-linux.org
To: Yves De Muyter <yves@sithi.connected.be>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20030108122009.GD16018@sithi.connected.be>
Message-Id: <ADA54D32-2305-11D7-BB92-0030656F07A2@esiee.fr>
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

On mercredi, jan 8, 2003, at 13:20 Europe/Paris, Yves De Muyter wrote:

> Hello,
>
> I just got a C240 and i'm new to the PA-RISC architecture. It runs 
> debian fine except the Visualize FX2 graphics board only works under 
> sticon. What's the status of an XFree or FB driver for this card? Is 
> any1 working on that?
Well, there is at the moment no support for FX cards.
Only Vis-EG are supported.

FX aren't likely to be supported soon, due to various legal problems 
(patents and co).

If you want to keep that FX card,  you'll have to use it with STICON...

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
