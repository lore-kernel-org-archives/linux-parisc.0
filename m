From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: Penguin color problems on HCRX-24
Date: Mon, 1 Nov 2004 18:21:33 +0100
Message-ID: <200411011821.34099.deller@gmx.de>
References: <200410292228.14940.j.raspe@t-online.de>
	<200411011345.36889.deller@gmx.de>
	<7738.193.160.141.5.1099317819.squirrel@193.160.141.5>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "Andy Walker" <ajwalker@broadpark.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7738.193.160.141.5.1099317819.squirrel@193.160.141.5>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Monday 01 November 2004 15:03, Andy Walker wrote:
> Hi Helge,
> 
> The logic is all wrong though IMHO. What it say is:
> 
> - If I have specified a bpp for *ANY* fb, then default
>   the others to their "capability" - for HCRX24 this is 32.
> 
> - If I have not specified any bpp's then default to 8bpp
>   on all.
> 
> e.g. with a Vis-EG on fb0 and an HCRX24's on fb1 and the commandline:
> 
>   stif=bpp:8
> 
> fb0 comes up 8bpp and fb1 comes up 32bpp, but with no commandline
> they both come up 8bpp. That's weird.
> 
> My change made the logic:
> 
> - Default all fb's to their "capability", except where the
>   user says otherwise for a given fb (you can default an fb
>   by setting 0 e.g. stifb=bpp=0:8).

Ok - please commit your patch, but without this unnecessary part:
+       for (i = 0; i < MAX_STI_ROMS; i++)
+               stifb_bpp_pref[i] = 0;

Rgs,
Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
