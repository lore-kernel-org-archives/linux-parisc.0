Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gremg1.net.external.hp.com (grenmg1.net.external.hp.com [155.208.254.57])
	by dsl2.external.hp.com (Postfix) with ESMTP id 448814834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Mar 2003 05:45:41 -0700 (MST)
Date: Thu, 13 Mar 2003 13:45:58 +0100
From: Lyonel Vincent <vincentl@ec-lyon.fr>
To: bruno_vidal@hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] enumerating devices from user space
Message-Id: <20030313134558.6cf9177c.vincentl@ec-lyon.fr>
In-Reply-To: <3E706BE4.E53961BD@hp.com>
References: <20030313112232.A10172@typhon.pilat.fr>
	<3E706BE4.E53961BD@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi Bruno,

That sounds like what I was looking for (HW path + version information)!
What do you think is the best approach?

cheers,
lv.

On Thu, 13 Mar 2003 12:30:44 +0100
bruno_vidal@hp.com wrote:

>     Hi guys.
> While developping the dump modules, I had to find a way to retrieve
> the hardware path of disk/hba. So I had to developpe a small hack
> in the kernel/firmware.c in order to retrive the right hba.
> But it is parisc dependant. Do you want I try to add an ioctl in my
> dump modules in order to print in user space this informations ?
> Example:
> 
> size:1500160 nr_sects:3000320 start_sect:374784
> hwpath: 0/0/1/1.15.0.0.
> dump device opened: 0x813 with index: 0 at hpa: 0x900
> 
> So my functions are able to print the hw path of each io modules.
> Is it what you are looking for ?
> 
> --
>         Vidal Bruno, (770-4271)
>         SSD-HA Team, HP-UX & LINUX Support
>         bruno_vidal@admin.france.hp.com
> 
> 
