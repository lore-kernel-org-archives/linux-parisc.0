Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DB76486A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 May 2002 10:52:24 -0600 (MDT)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15573.24404.223525.294611@gargle.gargle.HOWL>
Date: Sun, 5 May 2002 18:35:32 +0200
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
Subject: Re: [parisc-linux] gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
In-Reply-To: <200205051545.g45Fj6CZ026798@hiauly1.hia.nrc.ca>
References: <15573.10385.229145.132477@gargle.gargle.HOWL>
	<200205051545.g45Fj6CZ026798@hiauly1.hia.nrc.ca>
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

John David Anglin writes:
> Thanks.  Could you try the following patch, please?

yes, allows the bootstrap.

> --- 5ntaprop.adb.~1.3.~	Sun Mar 17 09:08:21 2002
> +++ 5ntaprop.adb	Sun Apr 28 22:42:59 2002
> @@ -45,9 +45,6 @@
>  --  used for Ada_Task_Control_Block
>  --           Task_ID
>  
> -with System.OS_Primitives;
> ---  used for Delay_Modes
> -
>  with System.Error_Reporting;
>  --  used for Shutdown
>  
> @@ -55,7 +52,6 @@
>  
>     use System.Tasking;
>     use System.Parameters;
> -   use System.OS_Primitives;
>  
>     -----------------
>     -- Stack_Guard --
> 
