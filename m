From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
Date: Sun, 5 May 2002 18:35:32 +0200
Message-ID: <15573.24404.223525.294611__41081.3592993238$1416621276$gmane$org@gargle.gargle.HOWL>
References: <15573.10385.229145.132477@gargle.gargle.HOWL>
	<200205051545.g45Fj6CZ026798@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200205051545.g45Fj6CZ026798@hiauly1.hia.nrc.ca>
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
