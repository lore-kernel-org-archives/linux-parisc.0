From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
	function on hppa
Date: Tue, 22 May 2007 21:37:09 -0600
Message-ID: <20070523033709.GO18519__14984.3961619355$1416624362$gmane$org@parisc-linux.org>
References: <20070520015215.GA26949@amd64.aurel32.net>
	<20070520015653.GA22224@amd64.aurel32.net>
	<119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com>
	<4652C3EF.3020905@aurel32.net>
	<119aab440705220705s13c5fa96yd27857e22afbd2bd@mail.gmail.com>
	<20070522151930.GA16377@farad.aurel32.net>
	<20070522153723.GC16717@fattire.cabal.ca>
	<119aab440705221919pa9f14a7kc8330b6c7ad9ffec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 libc-ports@sourceware.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705221919pa9f14a7kc8330b6c7ad9ffec@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 22, 2007 at 10:19:32PM -0400, Carlos O'Donell wrote:
> The code shouldn't undefine or define anything a user might define.
> All the constants have to go away. This header needs a rewrite.

However, the _ namespace is reserved to the library.  So _LWS_EGAIN is
permissible.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
