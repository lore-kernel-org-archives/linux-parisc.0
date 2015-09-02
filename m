From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Align locks for LWS syscalls to L1 cache size
Date: Thu, 3 Sep 2015 00:18:30 +0200
Message-ID: <55E775B6.3040702@gmx.de>
References: <20150902193840.GA4499@ls3530.box>
 <1441229561.2259.18.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1441229561.2259.18.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 02.09.2015 23:32, James Bottomley wrote:
> On Wed, 2015-09-02 at 21:38 +0200, Helge Deller wrote:
>> Align the locks for the Light weight syscall (LWS) which is used for
>> atomic userspace operations (e.g. gcc atomic builtins) on L1 cache
>> boundaries. This should speed up LWS calls on PA20 systems.
> 
> Is there any evidence for this?  The architectural requirement for ldcw
> on which all this is based is pegged at 16 bytes.  This implies that the
> burst width on PA88/89 may indeed be 128 bytes, but the coherence width
> for operations may still be 16 bytes.  If that speculation is true,
> there's no speed at all gained by aligning ldcw to 128 bytes and all you
> do is waste space.

Sure, we'll have to measure timings here...

Helge

