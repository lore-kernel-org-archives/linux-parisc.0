From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: 12 Sep 2004 09:58:15 -0400
Message-ID: <1094997501.1714.4.camel@mulgrave>
References: <20040911165325.GO28659@tausq.org>
	<20040912134707.GL1854@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912134707.GL1854@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2004-09-12 at 09:47, Carlos O'Donell wrote:
> I'm looking through the module loading code and worrying about how
> absolute fixups works when a module needs a fixup?

It should work identically to non-module code ... what specifically is
worrying you?

> How are we handling module fixups with absolute fixup addresses?

The same way we do in the regular kernel ... jump to the absolute
address.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
