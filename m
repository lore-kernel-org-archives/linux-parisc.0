From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: Patch for stifb=bpp:x:y handling
Date: Mon, 1 Nov 2004 23:04:47 +0100
Message-ID: <200411012304.47678.deller@gmx.de>
References: <36432.127.0.0.1.1099347124.squirrel@127.0.0.1>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org
To: "Andy Walker" <ajwalker@broadpark.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <36432.127.0.0.1.1099347124.squirrel@127.0.0.1>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Andy,

On Monday 01 November 2004 23:12, Andy Walker wrote:
> Okay, here's the revised patch. Although the diff says its against
> rc1-pa5 it should apply cleanly to rc1-pa8 (my rc1-pa5 has Helge's
> second HCRX24 patch applied, making it equivalent to rc1-pa8).
> 
> Willy (or some other kind soul), can this get submitted please -
> it fixes cruft in the previous options patch.

Thanks!
I just committed it to CVS and it's now in 2.6.10-rc1-pa9.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
