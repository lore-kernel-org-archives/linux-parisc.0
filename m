From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Align locks for LWS syscalls to L1 cache size
Date: Wed, 02 Sep 2015 14:32:41 -0700
Message-ID: <1441229561.2259.18.camel@HansenPartnership.com>
References: <20150902193840.GA4499@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org,
	ohn David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150902193840.GA4499@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2015-09-02 at 21:38 +0200, Helge Deller wrote:
> Align the locks for the Light weight syscall (LWS) which is used for
> atomic userspace operations (e.g. gcc atomic builtins) on L1 cache
> boundaries. This should speed up LWS calls on PA20 systems.

Is there any evidence for this?  The architectural requirement for ldcw
on which all this is based is pegged at 16 bytes.  This implies that the
burst width on PA88/89 may indeed be 128 bytes, but the coherence width
for operations may still be 16 bytes.  If that speculation is true,
there's no speed at all gained by aligning ldcw to 128 bytes and all you
do is waste space.

James


